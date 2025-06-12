# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

# Create web_traffic_data DataFrame
from pyspark.sql import Row

web_data = [
    Row(UserID=1, Page="Home", Timestamp="2024-04-10 10:00:00", Duration=35, Device="Mobile", Country="India"),
    Row(UserID=2, Page="Products", Timestamp="2024-04-10 10:02:00", Duration=120, Device="Desktop", Country="USA"),
    Row(UserID=3, Page="Cart", Timestamp="2024-04-10 10:05:00", Duration=45, Device="Tablet", Country="UK"),
    Row(UserID=1, Page="Checkout", Timestamp="2024-04-10 10:08:00", Duration=60, Device="Mobile", Country="India"),
    Row(UserID=4, Page="Home", Timestamp="2024-04-10 10:10:00", Duration=15, Device="Mobile", Country="Canada"),
    Row(UserID=2, Page="Contact", Timestamp="2024-04-10 10:15:00", Duration=25, Device="Desktop", Country="USA"),
    Row(UserID=5, Page="Products", Timestamp="2024-04-10 10:20:00", Duration=90, Device="Desktop", Country="India"),
]

df_web = spark.createDataFrame(web_data)
df_web.show(truncate=False)


# COMMAND ----------

#1 Display schema
df_web.printSchema()


# COMMAND ----------

#2 Convert Timestamp to proper type
from pyspark.sql.functions import to_timestamp

df_web_ts = df_web.withColumn("Timestamp", to_timestamp("Timestamp", "yyyy-MM-dd HH:mm:ss"))
df_web_ts.show(truncate=False)


# COMMAND ----------

#3 Add SessionMinute column
from pyspark.sql.functions import minute

df_web_ts = df_web_ts.withColumn("SessionMinute", minute("Timestamp"))
df_web_ts.select("UserID", "Page", "Timestamp", "SessionMinute").show()


# COMMAND ----------

#4 Filter Mobile + Checkout
from pyspark.sql.functions import col

df_web_ts.filter((col("Device") == "Mobile") & (col("Page") == "Checkout")).show()


# COMMAND ----------

#5 Filter Duration > 60
df_web_ts.filter(col("Duration") > 60).show()


# COMMAND ----------

#6 Filter India + Products
df_web_ts.filter((col("Country") == "India") & (col("Page") == "Products")).show()


# COMMAND ----------

#7 Avg Duration per Device
from pyspark.sql.functions import avg

df_web_ts.groupBy("Device").agg(avg("Duration").alias("AvgDuration")).show()


# COMMAND ----------

#8 Count sessions per country
df_web_ts.groupBy("Country").count().withColumnRenamed("count", "SessionCount").show()


# COMMAND ----------

#9 Most visited page
df_web_ts.groupBy("Page").count().orderBy(col("count").desc()).limit(1).show()


# COMMAND ----------

#10 Rank pages per user
from pyspark.sql.window import Window
from pyspark.sql.functions import rank

window_spec = Window.partitionBy("UserID").orderBy("Timestamp")

df_ranked = df_web_ts.withColumn("PageRank", rank().over(window_spec))
df_ranked.select("UserID", "Page", "Timestamp", "PageRank").show()


# COMMAND ----------

#11 Total duration per user
from pyspark.sql.functions import sum as _sum

df_web_ts.groupBy("UserID").agg(_sum("Duration").alias("TotalDuration")).show()


# COMMAND ----------

#12 Register as temporary view
df_web_ts.createOrReplaceTempView("traffic_view")


# COMMAND ----------

#13 SQL - Top 2 longest sessions
spark.sql("""
    SELECT UserID, Page, Duration
    FROM traffic_view
    ORDER BY Duration DESC
    LIMIT 2
""").show()


# COMMAND ----------

#14 SQL - Unique users per page
spark.sql("""
    SELECT Page, COUNT(DISTINCT UserID) as UniqueUsers
    FROM traffic_view
    GROUP BY Page
""").show()


# COMMAND ----------

#15 Save final DataFrame to CSV
df_web_ts.write.mode("overwrite").option("header", "true").csv("dbfs:/FileStore/web_traffic/csv_output")

# COMMAND ----------

# Read back the CSV and display it
df_csv_read = spark.read.option("header", "true").csv("/tmp/web_traffic_csv")
df_csv_read.show(truncate=False)


# COMMAND ----------

import shutil
import os
import uuid

# 1. Set up local temp folder
local_temp_csv = f"/tmp/web_traffic_csv_{uuid.uuid4()}"
os.makedirs(local_temp_csv, exist_ok=True)

# 2. Copy part files from DBFS to local temp
dbfs_csv_path = "/dbfs/FileStore/web_traffic/csv_output"
for file in os.listdir(dbfs_csv_path):
    shutil.copy(os.path.join(dbfs_csv_path, file), local_temp_csv)

# 3. Zip the folder
local_zip_path = "/tmp/web_traffic_csv.zip"
shutil.make_archive(local_zip_path.replace(".zip", ""), 'zip', local_temp_csv)

# 4. Move zip to DBFS
dbfs_zip_path = "/dbfs/FileStore/web_traffic/web_traffic_csv.zip"
shutil.copy(local_zip_path, dbfs_zip_path)


# COMMAND ----------

#16 Save partitioned by Country as Parquet
df_web_ts.write.mode("overwrite").partitionBy("Country").parquet("dbfs:/FileStore/web_traffic/parquet_by_country")

# COMMAND ----------

# Read back the Parquet and display it
df_parquet_read = spark.read.parquet("/tmp/web_traffic_parquet_by_country")
df_parquet_read.show(truncate=False)


# COMMAND ----------

import shutil
import os
import uuid

# 1. Define local temp folder
local_temp_parquet = f"/tmp/web_traffic_parquet_{uuid.uuid4()}"
dbfs_parquet_source = "/dbfs/FileStore/web_traffic/parquet_by_country"

# 2. Recursively copy full folder (including subdirectories)
shutil.copytree(dbfs_parquet_source, local_temp_parquet)

# 3. Zip the copied folder
local_zip_path = "/tmp/web_traffic_parquet_by_country.zip"
shutil.make_archive(local_zip_path.replace(".zip", ""), 'zip', local_temp_parquet)

# 4. Move zip to DBFS for download
dbfs_zip_path = "/dbfs/FileStore/web_traffic/web_traffic_parquet_by_country.zip"
shutil.copy(local_zip_path, dbfs_zip_path)
