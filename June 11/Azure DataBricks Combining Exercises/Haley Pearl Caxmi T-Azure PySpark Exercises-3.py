# Databricks notebook source
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, avg, when, udf, current_date, months_between, to_date, lit
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, DoubleType

spark = SparkSession.builder.getOrCreate()
spark

# COMMAND ----------

# Schema for employee_data
employee_schema = StructType([
    StructField("Name", StringType(), True),
    StructField("Department", StringType(), True),
    StructField("Salary", IntegerType(), True)
])

employee_data = [
    ("Ananya", "HR", 52000),
    ("Rahul", "Engineering", 65000),
    ("Priya", "Engineering", 60000),
    ("Zoya", "Marketing", 48000),
    ("Karan", "HR", 53000),
    ("Naveen", "Engineering", 70000),
    ("Fatima", "Marketing", 45000)
]
df_emp = spark.createDataFrame(employee_data, schema=employee_schema)

# Schema for performance_data
performance_schema = StructType([
    StructField("Name", StringType(), True),
    StructField("Year", IntegerType(), True),
    StructField("Rating", DoubleType(), True)
])

performance_data = [
    ("Ananya", 2023, 4.5),
    ("Rahul", 2023, 4.9),
    ("Priya", 2023, 4.3),
    ("Zoya", 2023, 3.8),
    ("Karan", 2023, 4.1),
    ("Naveen", 2023, 4.7),
    ("Fatima", 2023, 3.9)
]
df_perf = spark.createDataFrame(performance_data, schema=performance_schema)

# Schema for project_data
project_schema = StructType([
    StructField("Name", StringType(), True),
    StructField("Project", StringType(), True),
    StructField("HoursWorked", IntegerType(), True)
])

project_data = [
    ("Ananya", "HR Portal", 120),
    ("Rahul", "Data Platform", 200),
    ("Priya", "Data Platform", 180),
    ("Zoya", "Campaign Tracker", 100),
    ("Karan", "HR Portal", 130),
    ("Naveen", "ML Pipeline", 220),
    ("Fatima", "Campaign Tracker", 90)
]
df_proj = spark.createDataFrame(project_data, schema=project_schema)


# COMMAND ----------

# 1. Join employee_data, performance_data, and project_data
from pyspark.sql.functions import *

df_joined = df_emp.join(df_perf, "Name").join(df_proj, "Name")
df_joined.show()



# COMMAND ----------

# 2. Total hours worked per department
from pyspark.sql.functions import *

df_joined = df_emp.join(df_perf, "Name").join(df_proj, "Name")
df_joined.show()


# COMMAND ----------

# 3. Average rating per project
from pyspark.sql.functions import avg

df_avg_rating = df_joined.groupBy("Project").agg(avg("Rating").alias("AverageRating"))
df_avg_rating.show()


# COMMAND ----------

# 4. Add a row with None rating
from pyspark.sql import Row

new_row = Row(Name="Meena", Year=2023, Rating=None)
df_perf_null = df_perf.union(spark.createDataFrame([new_row], schema=performance_schema))
df_perf_null.show()


# COMMAND ----------

#5 Filter rows with null values
df_perf_null.filter(col("Rating").isNull()).show()

# COMMAND ----------

#6 Replace null ratings with the department average
from pyspark.sql.functions import col, avg, when, lit, coalesce

df_perf_dept = df_perf_null.join(df_emp, on="Name", how="left")
dept_avg = df_perf_dept.filter(col("Rating").isNotNull()) \
    .groupBy("Department").agg(avg("Rating").alias("DeptAvg"))
global_avg = df_perf_dept.filter(col("Rating").isNotNull()) \
    .agg(avg("Rating").alias("GlobalAvg")).first()["GlobalAvg"]
df_filled = df_perf_dept.join(dept_avg, on="Department", how="left") \
    .withColumn("Rating", when(col("Rating").isNull(), coalesce(col("DeptAvg"), lit(global_avg)))
                .otherwise(col("Rating"))) \
    .select("Name", "Department", "Year", "Rating")
df_filled.show()


# COMMAND ----------

#7 Create a column PerformanceCategory
from pyspark.sql.functions import when

df_category = df_filled.withColumn(
    "PerformanceCategory",
    when(col("Rating") >= 4.7, "Excellent")
    .when(col("Rating") >= 4.0, "Good")
    .otherwise("Average")
)
df_category.show()


# COMMAND ----------

#8 Create a UDF to assign bonus
from pyspark.sql.functions import udf
from pyspark.sql.types import IntegerType

def bonus_udf(hours):
    return 10000 if hours > 200 else 5000

bonus = udf(bonus_udf, IntegerType())

df_bonus = df_joined.withColumn("Bonus", bonus(col("HoursWorked")))
df_bonus.select("Name", "Project", "HoursWorked", "Bonus").show()

# COMMAND ----------

 #9. Add JoinDate and MonthsWorked
from pyspark.sql.functions import current_date, months_between, to_date, lit

df_join_date = df_emp.withColumn("JoinDate", lit("2021-06-01")) \
    .withColumn("JoinDate", to_date("JoinDate")) \
    .withColumn("MonthsWorked", months_between(current_date(), col("JoinDate")).cast("int"))

df_join_date.select("Name", "Department", "JoinDate", "MonthsWorked").show()

# COMMAND ----------

#10. Calculate employees joined before 2022
from pyspark.sql.functions import to_date

df_before_2022 = df_join_date.filter(col("JoinDate") < to_date(lit("2022-01-01")))
df_before_2022.select("Name", "JoinDate").show()

# COMMAND ----------

#11. Union with extra employees
extra_employees = [
    ("Meena", "HR", 48000),
    ("Raj", "Marketing", 51000)
]
df_extra = spark.createDataFrame(extra_employees, schema=employee_schema)
df_emp_union = df_emp.union(df_extra)
df_emp_union.show()

# COMMAND ----------

#12. Save merged dataset as partitioned Parquet (by Department)
from pyspark.sql.functions import *

df_merged = df_emp.join(df_perf, "Name", "inner") \
                  .join(df_proj, "Name", "inner")

df_merged.write.mode("overwrite").partitionBy("Department").parquet("/tmp/merged_output_partitioned")
