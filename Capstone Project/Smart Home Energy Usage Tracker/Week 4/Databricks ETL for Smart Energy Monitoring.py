# Databricks notebook source
spark

# COMMAND ----------

#1.Upload cleaned logs to Databricks

df = spark.read.option("header", "true").csv("file:/Workspace/Shared/cleaned_energy_logs.csv", inferSchema=True)

df.show(5)
df.printSchema()


# COMMAND ----------

#2.Build ETL pipeline to calculate daily/weekly summaries

from pyspark.sql.functions import to_date, to_timestamp, weekofyear, sum, round

# Timestamp conversion and new columns
df = df.withColumn("timestamp", to_timestamp("timestamp"))
df = df.withColumn("date", to_date("timestamp"))
df = df.withColumn("week", weekofyear("timestamp"))

# Daily Summary per Room
daily_summary = df.groupBy("date", "room_id") \
    .agg(round(sum("energy_kwh"), 2).alias("daily_energy_kwh"))

# Weekly Summary per Room
weekly_summary = df.groupBy("week", "room_id") \
    .agg(round(sum("energy_kwh"), 2).alias("weekly_energy_kwh"))

daily_summary.show()
weekly_summary.show()


# COMMAND ----------

#3.Save Final Results in Delta & CSV Format
# Save as Delta
daily_summary.write.format("delta").mode("overwrite").save("file:/Workspace/Shared/delta/daily_summary")
weekly_summary.write.format("delta").mode("overwrite").save("file:/Workspace/Shared/delta/weekly_summary")

# Save as CSV
daily_summary.write.option("header", "true").mode("overwrite").csv("file:/Workspace/Shared/output/daily_summary_csv")
weekly_summary.write.option("header", "true").mode("overwrite").csv("file:/Workspace/Shared/output/weekly_summary_csv")


# COMMAND ----------

#4.Optional – SQL query for devices exceeding 10 kWh/day
# Register view
df.createOrReplaceTempView("energy_logs")

# SQL: devices using >10 kWh in a day
spark.sql("""
SELECT device_id, date, ROUND(SUM(energy_kwh), 2) AS daily_kwh
FROM energy_logs
GROUP BY device_id, date
HAVING daily_kwh > 10
""").show()
