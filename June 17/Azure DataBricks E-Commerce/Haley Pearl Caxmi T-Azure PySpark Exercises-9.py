# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

#1. Ingest all 3 CSVs as Delta Tables
# Load as DataFrames
df_orders = spark.read.option("header", True).option("inferSchema", True) \
    .csv("file:/Workspace/Shared/orders.csv")

df_customers = spark.read.option("header", True).option("inferSchema", True) \
    .csv("file:/Workspace/Shared/customers.csv")

df_products = spark.read.option("header", True).option("inferSchema", True) \
    .csv("file:/Workspace/Shared/products.csv")

# Save as Delta
df_orders.write.mode("overwrite").format("delta").save("/Workspace/Shared/delta/orders")
df_customers.write.mode("overwrite").format("delta").save("/Workspace/Shared/delta/customers")
df_products.write.mode("overwrite").format("delta").save("/Workspace/Shared/delta/products")
#show the tables
df_customers.show()
df_products.show()
df_orders.show()

# COMMAND ----------

#2. Total Revenue per Product
from pyspark.sql.functions import col, sum

df_revenue_product = df_orders.withColumn("Revenue", col("Quantity") * col("Price")) \
    .groupBy("ProductID").agg(sum("Revenue").alias("TotalRevenue"))

df_revenue_product.show()

# COMMAND ----------

#3. Revenue by Region (Join Orders + Customers)
from pyspark.sql.functions import col, sum

df_joined = df_orders.join(df_customers, "CustomerID")

df_revenue_region = df_joined.withColumn("Revenue", col("Quantity") * col("Price")) \
    .groupBy("Region").agg(sum("Revenue").alias("TotalRevenue"))
df_revenue_region.show()

# COMMAND ----------

#4. Update Status of Pending Orders to 'Cancelled'
from delta.tables import DeltaTable
from pyspark.sql.functions import expr

orders_table = DeltaTable.forPath(spark, "/Workspace/Shared/delta/orders")

orders_table.update(
    condition=expr("Status = 'Pending'"),
    set={"Status": expr("'Cancelled'")}
)
spark.read.format('delta').load('/Workspace/Shared/delta/orders').show()

# COMMAND ----------

 #5. Merge a New Return Record into Orders
from pyspark.sql import Row

new_return = [Row(OrderID=3006, CustomerID='C002', ProductID='P1003',
                  Quantity=1, Price=30000, OrderDate='2024-05-06', Status='Returned')]

df_new = spark.createDataFrame(new_return)

orders_table.alias("target").merge(
    df_new.alias("source"),
    "target.OrderID = source.OrderID"
).whenNotMatchedInsertAll().execute()
df_new.show()

# COMMAND ----------

#6. DLT Pipeline Simulation: Raw → Cleaned → Aggregated
df_orders_raw = spark.read.format("delta").load("/Workspace/Shared/delta/orders")

# Cleaned table: remove rows with any NULLs
df_cleaned = df_orders_raw.na.drop()
df_cleaned.show()
# 11Optionally register as temp view if needed later
df_cleaned.createOrReplaceTempView("orders_cleaned")
from pyspark.sql.functions import col, sum

df_products = spark.read.format("delta").load("/Workspace/Shared/delta/products")

df_cleaned = spark.read.table("orders_cleaned")

df_joined = df_cleaned.join(df_products, on="ProductID")

df_category_revenue = df_joined.withColumn("Revenue", col("Quantity") * col("Price")) \
    .groupBy("Category").agg(sum("Revenue").alias("TotalRevenue"))

df_category_revenue.show()


# COMMAND ----------

#7. View Data Before the Status Update (Time Travel)
df_v0 = spark.read.format("delta").option("versionAsOf", 0) \
    .load("/Workspace/Shared/delta/orders")

df_v0.select("OrderID", "Status").show()

# COMMAND ----------

#8. Restore to an Older Version (e.g., version 0)
df_old = spark.read.format("delta").option("versionAsOf", 0) \
    .load("/Workspace/Shared/delta/orders")

df_old.write.format("delta").mode("overwrite") \
    .option("overwriteSchema", "true") \
    .save("/Workspace/Shared/delta/orders")
df_old.show()    

# COMMAND ----------

#9. VACUUM with Shortened Retention Period

spark.conf.set("spark.databricks.delta.retentionDurationCheck.enabled", False)

spark.sql("VACUUM delta.`/Workspace/Shared/delta/orders` RETAIN 0 HOURS")

# COMMAND ----------

#10. Expectations (Validation)
from pyspark.sql.functions import col

df_orders = spark.read.format("delta").load("/Workspace/Shared/delta/orders")

df_valid = df_orders.filter(
    (col("Quantity") > 0) &
    (col("Price") > 0) &
    (col("OrderDate").isNotNull())
)

df_valid.show()

# COMMAND ----------

#11. Bonus – OrderType Column with when-otherwise

from pyspark.sql.functions import when

df_orders = spark.read.format("delta").load("/Workspace/Shared/delta/orders")

df_with_order_type = df_orders.withColumn(
    "OrderType",
    when(col("Status") == "Returned", "Return").otherwise("Regular")
)

df_with_order_type.select("OrderID", "Status", "OrderType").show()