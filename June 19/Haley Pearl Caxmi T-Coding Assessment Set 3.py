# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

# Scenario 1: Inventory Alerting System

# 1. Load the data using PySpark.
df_inventory = (
    spark.read.option("header", "true").option("inferSchema", "true")
    .csv("file:/Workspace/Shared/inventory_supply.csv")
)
df_inventory.show()
# 2. Create a new column NeedsReorder = StockQty < ReorderLevel
from pyspark.sql.functions import col
df_inventory = df_inventory.withColumn("NeedsReorder", col("StockQty") < col("ReorderLevel"))

# 3. Create a view of all items that need restocking
df_inventory.filter("NeedsReorder = true").createOrReplaceTempView("items_to_restock")

# 4. Highlight warehouses with more than 2 such items
df_inventory.filter("NeedsReorder = true") \
    .groupBy("Warehouse").count().filter("count > 2").show()


# COMMAND ----------

# Scenario 2: Supplier Price Optimization

# 1. Group items by Supplier and compute average price
df_supplier_avg = df_inventory.groupBy("Supplier").avg("UnitPrice").withColumnRenamed("avg(UnitPrice)", "AvgPrice")
df_supplier_avg.show()

# 2. Find which suppliers offer items below average price in their category
from pyspark.sql.window import Window
from pyspark.sql.functions import avg, expr

cat_window = Window.partitionBy("Category")
df_inventory = df_inventory.withColumn("CategoryAvg", avg("UnitPrice").over(cat_window))
df_inventory = df_inventory.withColumn("BelowCategoryAvg", col("UnitPrice") < col("CategoryAvg"))

# 3. Tag suppliers with Good Deal if >50% of their items are below market average
df_good_deals = df_inventory.groupBy("Supplier").agg(
    (expr("sum(case when BelowCategoryAvg then 1 else 0 end) * 1.0 / count(*)")).alias("BelowAvgRatio")
).withColumn("GoodDeal", col("BelowAvgRatio") > 0.5)

df_good_deals.show()


# COMMAND ----------

# Scenario 3: Cost Forecasting

# 1. Calculate TotalStockValue = StockQty * UnitPrice
df_inventory = df_inventory.withColumn("TotalStockValue", col("StockQty") * col("UnitPrice"))

# 2. Identify top 3 highest-value items
df_inventory.orderBy(col("TotalStockValue").desc()).select("ItemName", "TotalStockValue").show(3)

# 3. Export the result as a Parquet file partitioned by Warehouse
df_inventory.write.mode("overwrite").partitionBy("Warehouse").parquet("file:/Workspace/Shared/inventory_cost_forecast")


# COMMAND ----------

# Scenario 4: Warehouse Utilization

# 1. Count items stored per warehouse
df_inventory.groupBy("Warehouse").count().withColumnRenamed("count", "ItemCount").show()

# 2. Average stock per category in each warehouse
df_inventory.groupBy("Warehouse", "Category").avg("StockQty").withColumnRenamed("avg(StockQty)", "AvgStock").show()

# 3. Determine underutilized warehouses (total stock < 100)
df_inventory.groupBy("Warehouse").sum("StockQty").withColumnRenamed("sum(StockQty)", "TotalStock") \
    .filter("TotalStock < 100").show()


# COMMAND ----------

# Scenario 5: Delta Audit Trail

# 1. Save as Delta table retail_inventory
df_inventory.write.format("delta").mode("overwrite").save("file:/Workspace/Shared/retail_inventory")

# 2. Update stock of 'Laptop' to 20
from delta.tables import DeltaTable
delta_tbl = DeltaTable.forPath(spark, "file:/Workspace/Shared/retail_inventory")
delta_tbl.update(condition="ItemName = 'Laptop'", set={"StockQty": "20"})

# 3. Delete any item with StockQty = 0
delta_tbl.delete(condition="StockQty = 0")

# 4. Run DESCRIBE HISTORY and query VERSION AS OF previous state
spark.sql("DESCRIBE HISTORY delta.`file:/Workspace/Shared/retail_inventory`").show()
prev_ver = spark.read.format("delta").option("versionAsOf", 0).load("file:/Workspace/Shared/retail_inventory")
prev_ver.show()


# COMMAND ----------

# Scenario 6: Alerts from Restock Logs

# 1. Load restock_logs.csv and join to update StockQty
df_logs = spark.read.option("header", "true").option("inferSchema", "true") \
    .csv("file:/Workspace/Shared/restock_logs.csv")

from pyspark.sql.functions import expr

df_updated = df_inventory.join(df_logs, "ItemID", "left") \
    .withColumn("NewStockQty", expr("StockQty + coalesce(QuantityAdded, 0)")) \
    .withColumn("RestockedRecently", col("QuantityAdded").isNotNull())

df_updated.select("ItemID", "ItemName", "StockQty", "QuantityAdded", "NewStockQty", "RestockedRecently").show()

# 2. Use MERGE INTO to update in Delta
delta_tbl.alias("target").merge(
    df_updated.alias("source"),
    "target.ItemID = source.ItemID"
).whenMatchedUpdate(set={"StockQty": "source.NewStockQty"}).execute()


# COMMAND ----------

# Scenario 7: Report Generation with SQL Views

# 1. Create SQL view inventory_summary
df_inventory = df_inventory.withColumn("TotalStockValue", col("StockQty") * col("UnitPrice"))
df_inventory.createOrReplaceTempView("inventory_summary")
spark.sql("SELECT * FROM inventory_summary").show()

# 2. Create supplier_leaderboard sorted by average price
df_inventory.groupBy("Supplier").avg("UnitPrice") \
    .withColumnRenamed("avg(UnitPrice)", "AvgUnitPrice") \
    .orderBy("AvgUnitPrice", ascending=False) \
    .createOrReplaceTempView("supplier_leaderboard")

spark.sql("SELECT * FROM supplier_leaderboard").show()


# COMMAND ----------

# Scenario 8: Advanced Filtering

from pyspark.sql.functions import when

# 1. Categorize items using when/otherwise
df_inventory = df_inventory.withColumn("StockCategory", when(col("StockQty") > 2 * col("ReorderLevel"), "Overstocked")
                                       .otherwise("LowStock"))

# 2. Use .filter() and .where()
df_inventory.filter("StockCategory = 'LowStock'").show()
df_inventory.where("StockCategory = 'Overstocked'").show()


# COMMAND ----------

# Scenario 9: Feature Engineering

from pyspark.sql.functions import to_date, month, current_date, datediff

# 1. Extract RestockMonth from LastRestocked
df_inventory = df_inventory.withColumn("RestockMonth", month(to_date("LastRestocked")))

# 2. Create StockAge = CURRENT_DATE - LastRestocked
df_inventory = df_inventory.withColumn("StockAge", datediff(current_date(), to_date("LastRestocked")))

# 3. Bucket StockAge
df_inventory = df_inventory.withColumn("AgeBucket",
    when(col("StockAge") <= 30, "New")
    .when(col("StockAge") <= 90, "Moderate")
    .otherwise("Stale")
)

df_inventory.select("ItemName", "StockAge", "AgeBucket").show()


# COMMAND ----------

# Scenario 10: Export Options

# 1. Write full DataFrame to CSV for analysts
df_inventory.write.mode("overwrite").option("header", "true") \
    .csv("file:/Workspace/Shared/export/inventory/csv_output")

# 2. Write to JSON for integration
df_inventory.write.mode("overwrite").json("file:/Workspace/Shared/export/inventory/json_output")

# 3. Save as Delta for pipelines
df_inventory.write.format("delta").mode("overwrite") \
    .save("file:/Workspace/Shared/export/inventory/delta_output")

# Save stale items separately
df_inventory.filter("AgeBucket = 'Stale'") \
    .write.mode("overwrite") \
    .parquet("file:/Workspace/Shared/export/inventory/stale_items")
