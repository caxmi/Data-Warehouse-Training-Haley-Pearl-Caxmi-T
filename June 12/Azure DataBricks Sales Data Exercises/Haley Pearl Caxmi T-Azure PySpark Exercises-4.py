# Databricks notebook source
from pyspark.sql import Row, SparkSession
from pyspark.sql.functions import explode, col, sum as _sum, count, when, avg
spark


# COMMAND ----------


data = [
    Row(OrderID=101, Customer="Ali", Items=[{"Product":"Laptop", "Qty":1}, {"Product":"Mouse", "Qty":2}], Region="Asia", Amount=1200.0),
    Row(OrderID=102, Customer="Zara", Items=[{"Product":"Tablet", "Qty":1}], Region="Europe", Amount=650.0),
    Row(OrderID=103, Customer="Mohan", Items=[{"Product":"Phone", "Qty":2}, {"Product":"Charger", "Qty":1}], Region="Asia", Amount=890.0),
    Row(OrderID=104, Customer="Sara", Items=[{"Product":"Desk", "Qty":1}], Region="US", Amount=450.0)
]

df_sales = spark.createDataFrame(data)
df_sales.show(truncate=False)


# COMMAND ----------

#1 Flatten the Items array using explode()
from pyspark.sql.functions import explode,col

df_exploded = df_sales.withColumn("Item", explode("Items")) \
                      .select("OrderID", "Customer", "Region", "Amount", col("Item.Product").alias("Product"), col("Item.Qty").alias("Qty"))
df_exploded.show()


# COMMAND ----------

#2 Count total quantity sold per product
df_exploded.groupBy("Product").agg(_sum("Qty").alias("TotalQtySold")).show()


# COMMAND ----------

#3 Count number of orders per region
df_sales.groupBy("Region").agg(count("*").alias("OrderCount")).show()


# COMMAND ----------

#4 Create HighValueOrder column
from pyspark.sql.functions import when

df_sales_flagged = df_sales.withColumn("HighValueOrder", when(col("Amount") > 1000, "Yes").otherwise("No"))
df_sales_flagged.select("OrderID", "Amount", "HighValueOrder").show()


# COMMAND ----------

#5 Add ShippingZone based on Region
df_sales_zoned = df_sales.withColumn("ShippingZone",
    when(col("Region") == "Asia", "Zone A")
    .when(col("Region") == "Europe", "Zone B")
    .when(col("Region") == "US", "Zone C")
    .otherwise("Other"))

df_sales_zoned.select("OrderID", "Region", "ShippingZone").show()


# COMMAND ----------

#6 Register as Temporary View
df_sales.createOrReplaceTempView("sales_view")


# COMMAND ----------

#7 SQL query on sales_view
spark.sql("""
    SELECT Region, COUNT(*) as OrderCount, AVG(Amount) as AvgAmount
    FROM sales_view
    GROUP BY Region
""").show()


# COMMAND ----------

#8 Save as Permanent Table
df_sales.write.mode("overwrite").saveAsTable("permanent_sales_view")
#to check 
spark.sql("SELECT * FROM permanent_sales_view").show()


# COMMAND ----------

#9 SQL query to filter orders with more than 1 item
spark.sql("""
    SELECT OrderID, Customer, Size(Items) AS ItemCount
    FROM sales_view
    WHERE SIZE(Items) > 1
""").show()


# COMMAND ----------

#10 SQL to get customers with Amount > 800
spark.sql("""
    SELECT Customer, Amount
    FROM sales_view
    WHERE Amount > 800
""").show()


# COMMAND ----------

#11 Save exploded DataFrame as partitioned Parquet
df_exploded.write.mode("overwrite").partitionBy("Region").parquet("dbfs:/FileStore/sales_data/parquet_partitioned")


# COMMAND ----------

#To download the parquet file
import shutil
import os
import uuid

# 1. Define local temp dir for the copy
local_temp_parquet = f"/tmp/sales_parquet_partitioned_{uuid.uuid4()}"
dbfs_parquet_source = "/dbfs/FileStore/sales_data/parquet_partitioned"

# 2. Recursively copy the full partitioned folder (with subdirectories)
shutil.copytree(dbfs_parquet_source, local_temp_parquet)

# 3. Zip the folder
local_zip_path = "/tmp/sales_parquet_partitioned.zip"
shutil.make_archive(local_zip_path.replace(".zip", ""), 'zip', local_temp_parquet)

# 4. Move zip to DBFS for download
dbfs_zip_dest = "/dbfs/FileStore/sales_data/sales_parquet_partitioned.zip"
shutil.copy(local_zip_path, dbfs_zip_dest)


# COMMAND ----------

#12 Read parquet and group by Product
df_parquet = spark.read.parquet("/tmp/sales_parquet_partitioned")
df_parquet.groupBy("Product").agg(_sum("Qty").alias("TotalQty")).show()
