# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

#1 Data Ingestion & Schema Analysis
# Load CSV using PySpark with schema inference
file_path = "file:/Workspace/Shared/traffic_logs.csv"

df_auto = (
    spark.read
    .option("header", "true")
    .option("inferSchema", "true")
    .option("timestampFormat", "yyyy-MM-dd HH:mm")
    .csv(file_path)
)

# Show inferred schema and data
df_auto.printSchema()
df_auto.show()

# Manually define schema and compare
from pyspark.sql.types import *

manual_schema = StructType([
    StructField("LogID", StringType(), True),
    StructField("VehicleID", StringType(), True),
    StructField("EntryPoint", StringType(), True),
    StructField("ExitPoint", StringType(), True),
    StructField("EntryTime", TimestampType(), True),
    StructField("ExitTime", TimestampType(), True),
    StructField("VehicleType", StringType(), True),
    StructField("SpeedKMH", IntegerType(), True),
    StructField("TollPaid", IntegerType(), True),
])

df_manual = spark.read.option("header", "true").schema(manual_schema).csv(file_path)
df_manual.printSchema()
df_manual.show()



# COMMAND ----------

#2 Derived Column Creation
# Add TripDurationMinutes and IsOverspeed columns
from pyspark.sql.functions import col, expr

df_derived = df_manual.withColumn(
    "TripDurationMinutes",
    (expr("unix_timestamp(ExitTime) - unix_timestamp(EntryTime)") / 60).cast("int")
).withColumn(
    "IsOverspeed",
    col("SpeedKMH") > 60
)

df_derived.show()


# COMMAND ----------

#3 Vehicle Behavior Aggregations
from pyspark.sql.functions import avg, sum, count, col

# Average speed per VehicleType
df_derived.groupBy("VehicleType").agg(avg("SpeedKMH").alias("AvgSpeed")).show()

# Total toll collected per EntryPoint
df_derived.groupBy("EntryPoint").agg(sum("TollPaid").alias("TotalToll")).show()

# Most used ExitPoint
df_derived.groupBy("ExitPoint").agg(count("*").alias("TripCount")).orderBy(col("TripCount").desc()).show(1)

# COMMAND ----------

#4 Window Functions

# Rank vehicles by speed within VehicleType
from pyspark.sql.window import Window
from pyspark.sql.functions import rank

w = Window.partitionBy("VehicleType").orderBy(col("SpeedKMH").desc())
df_ranked = df_derived.withColumn("SpeedRank", rank().over(w))
df_ranked.show()

# Find last exit time for each vehicle using lag()
from pyspark.sql.functions import lag

w_vehicle = Window.partitionBy("VehicleID").orderBy("EntryTime")

df_lagged = df_derived.withColumn("LastExitTime", lag("ExitTime").over(w_vehicle))
df_lagged.select("VehicleID", "EntryTime", "ExitTime", "LastExitTime").show()

# COMMAND ----------

#5 Session Segmentation
# Calculate idle time between trips
from pyspark.sql.functions import unix_timestamp, round

df_sessions = df_lagged.withColumn(
    "IdleTimeMinutes",
    round((unix_timestamp("EntryTime") - unix_timestamp("LastExitTime")) / 60, 2)
)

df_sessions.select("VehicleID", "EntryTime", "ExitTime", "LastExitTime", "IdleTimeMinutes").show()

# COMMAND ----------

#6 Anomaly Detection
# Speed > 70 and TripDuration < 10
df_anomaly1 = df_derived.filter((col("SpeedKMH") > 70) & (col("TripDurationMinutes") < 10))
df_anomaly1.show()

# Paid less toll for longer trips
df_anomaly2 = df_derived.filter((col("TripDurationMinutes") > 30) & (col("TollPaid") < 50))
df_anomaly2.show()

# Suspicious backtracking (ExitPoint < EntryPoint)
df_anomaly3 = df_derived.filter(col("ExitPoint") < col("EntryPoint"))
df_anomaly3.show()

# COMMAND ----------

#7 Join with Metadata
# Create vehicle registry and join
from pyspark.sql import Row

vehicle_data = [
    Row(VehicleID="V001", OwnerName="Anil", Model="Hyundai i20", RegisteredCity="Delhi"),
    Row(VehicleID="V002", OwnerName="Rakesh", Model="Tata Truck", RegisteredCity="Chennai"),
    Row(VehicleID="V003", OwnerName="Sana", Model="Yamaha R15", RegisteredCity="Mumbai"),
    Row(VehicleID="V004", OwnerName="Neha", Model="Honda City", RegisteredCity="Bangalore"),
    Row(VehicleID="V005", OwnerName="Zoya", Model="Volvo Bus", RegisteredCity="Pune"),
]

df_registry = spark.createDataFrame(vehicle_data)

# Join and group trips by RegisteredCity
df_joined = df_derived.join(df_registry, on="VehicleID", how="left")
df_joined.groupBy("RegisteredCity").count().show()

# COMMAND ----------

#8 Delta Lake Features
# Save as Delta Table
df_derived.write.format("delta").mode("overwrite").save("/Workspace/Shared/traffic_delta")

# MERGE INTO: Update toll for bikes
from delta.tables import DeltaTable

traffic_delta = DeltaTable.forPath(spark, "/Workspace/Shared/traffic_delta")

traffic_delta.alias("old").merge(
    df_derived.filter(col("VehicleType") == "Bike").withColumn("TollPaid", expr("TollPaid + 10")).alias("new"),
    "old.LogID = new.LogID"
).whenMatchedUpdate(set={"TollPaid": "new.TollPaid"}).execute()

# Delete long trips > 60 mins
traffic_delta.delete("TripDurationMinutes > 60")

# Delta versioning and history
spark.sql("DESCRIBE HISTORY delta.`/Workspace/Shared/traffic_delta`").show()

# Read version 0 of delta table
df_v0 = spark.read.format("delta").option("versionAsOf", 0).load("/Workspace/Shared/traffic_delta")
df_v0.show()


# COMMAND ----------

#9 Advanced Conditions

# Classify trip type
from pyspark.sql.functions import when

df_trip_types = df_derived.withColumn(
    "TripType",
    when(col("TripDurationMinutes") < 15, "Short")
    .when(col("TripDurationMinutes").between(15, 30), "Medium")
    .otherwise("Long")
)

df_trip_types.show()

# Flag vehicles with > 3 trips/day
from pyspark.sql.functions import to_date

df_flagged = df_trip_types.withColumn("TripDate", to_date("EntryTime"))

df_trip_count = df_flagged.groupBy("VehicleID", "TripDate").count().filter("count > 3")
df_trip_count.show()

# COMMAND ----------


#10 Export & Reporting

# Save to Parquet partitioned by VehicleType
df_derived.write.mode("overwrite").partitionBy("VehicleType").parquet("/Workspace/Shared/traffic_parquet")

# Save to CSV for dashboard
df_derived.write.mode("overwrite").option("header", "true").csv("/Workspace/Shared/traffic_dashboard_csv")

# Summary SQL View: total toll by VehicleType & ExitPoint
df_derived.createOrReplaceTempView("traffic_summary")

spark.sql("""
    SELECT VehicleType, ExitPoint, SUM(TollPaid) as TotalToll
    FROM traffic_summary
    GROUP BY VehicleType, ExitPoint
""").show()