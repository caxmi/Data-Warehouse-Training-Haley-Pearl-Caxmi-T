# Databricks notebook source
# Import necessary libraries
from pyspark.sql import SparkSession
from pyspark.sql.types import *
from pyspark.sql.functions import *

spark


# COMMAND ----------

#1. Load the data with schema inference enabled
df_infer = spark.read.option("header", "true").option("inferSchema", "true") \
    .csv("file:/Workspace/Shared/course_enrollments.csv")

df_infer.show()
df_infer.printSchema()


# COMMAND ----------

#2. Manually define schema and compare both approaches
from pyspark.sql.types import *

manual_schema = StructType([
    StructField("EnrollmentID", StringType(), True),
    StructField("StudentName", StringType(), True),
    StructField("CourseName", StringType(), True),
    StructField("Category", StringType(), True),
    StructField("EnrollDate", DateType(), True),
    StructField("ProgressPercent", IntegerType(), True),
    StructField("Rating", DoubleType(), True),
    StructField("Status", StringType(), True)
])

df_manual = spark.read.option("header", "true").schema(manual_schema) \
    .csv("file:/Workspace/Shared/course_enrollments.csv")

df_manual.show()
df_manual.printSchema()

# COMMAND ----------

#3. Filter records where ProgressPercent < 50
df_filtered = df_infer.filter(df_infer.ProgressPercent < 50)
df_filtered.show()

# COMMAND ----------

#4. Replace null ratings with average rating
from pyspark.sql.functions import avg, when, col

avg_rating = df_infer.select(avg("Rating")).first()[0]

df_filled = df_infer.withColumn("Rating", when(col("Rating").isNull(), avg_rating).otherwise(col("Rating")))
df_filled.show()

# COMMAND ----------

#5. Add column IsActive → 1 if Status is Active, else 0
df_active = df_filled.withColumn("IsActive", when(col("Status") == "Active", 1).otherwise(0))
df_active.show()

# COMMAND ----------

#6. Find average progress by course
df_active.groupBy("CourseName").avg("ProgressPercent").show()

# COMMAND ----------

#7. Get count of students in each course category
df_active.groupBy("Category").count().show()

# COMMAND ----------

#8. Identify the most enrolled course
from pyspark.sql.functions import desc

df_active.groupBy("CourseName").count().orderBy(desc("count")).limit(1).show()

# COMMAND ----------

#9. Load course_details.csv
df_course_details = spark.read.option("header", "true").option("inferSchema", "true") \
    .csv("file:/Workspace/Shared/course_details.csv")

df_course_details.show()

# COMMAND ----------

#10. Join course_enrollments with course_details
df_joined = df_active.join(df_course_details, on="CourseName", how="left")
df_joined.show()

# COMMAND ----------

#11. Rank students in each course based on ProgressPercent
from pyspark.sql.window import Window
from pyspark.sql.functions import rank

windowSpec = Window.partitionBy("CourseName").orderBy(desc("ProgressPercent"))

df_ranked = df_joined.withColumn("Rank", rank().over(windowSpec))
df_ranked.select("StudentName", "CourseName", "ProgressPercent", "Rank").show()

# COMMAND ----------

#12. Get lead and lag of EnrollDate by Category
from pyspark.sql.functions import lead, lag

windowCat = Window.partitionBy("Category").orderBy("EnrollDate")

df_lead_lag = df_joined.withColumn("NextEnrollDate", lead("EnrollDate").over(windowCat)) \
    .withColumn("PrevEnrollDate", lag("EnrollDate").over(windowCat))

df_lead_lag.select("EnrollmentID", "Category", "EnrollDate", "NextEnrollDate", "PrevEnrollDate").show()

# COMMAND ----------

#13. Pivot data to show total enrollments by Category and Status
df_pivot = df_joined.groupBy("Category").pivot("Status").count()
df_pivot.show()

# COMMAND ----------

#14. Extract year and month from EnrollDate
from pyspark.sql.functions import year, month

df_with_date = df_joined.withColumn("EnrollYear", year("EnrollDate")) \
                        .withColumn("EnrollMonth", month("EnrollDate"))

df_with_date.select("EnrollmentID", "EnrollDate", "EnrollYear", "EnrollMonth").show()

# COMMAND ----------

#15. Drop rows where Status is null or empty
df_cleaned = df_with_date.filter((col("Status").isNotNull()) & (col("Status") != ""))
df_cleaned.show()

# COMMAND ----------

#16. Remove duplicate enrollments using dropDuplicates()
df_no_duplicates = df_cleaned.dropDuplicates(["EnrollmentID"])
df_no_duplicates.show()

# COMMAND ----------

#17. Write final cleaned DataFrame to:
# CSV 
df_no_duplicates.write.mode("overwrite") \
    .option("header", "true") \
    .csv("file:/Workspace/Shared/final_course_output_csv")

# JSON 
df_no_duplicates.write.mode("overwrite") \
    .json("file:/Workspace/Shared/final_course_output_json")

# Parquet 
df_no_duplicates.write.mode("overwrite") \
    .option("compression", "snappy") \
    .parquet("file:/Workspace/Shared/final_course_output_parquet")