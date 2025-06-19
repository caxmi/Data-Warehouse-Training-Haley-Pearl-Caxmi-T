# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

#1 Ingestion & Time Fields

# Load into PySpark with inferred schema
df_enroll = (
    spark.read
    .option("header", "true")
    .option("inferSchema", "true")
    .csv("file:/Workspace/Shared/course_enrollments.csv")
)

# Convert EnrollDate and CompletionDate to date type
from pyspark.sql.functions import to_date, datediff

df_enroll = df_enroll.withColumn("EnrollDate", to_date("EnrollDate")) \
                     .withColumn("CompletionDate", to_date("CompletionDate"))

# Add DaysToComplete column if completed
df_enroll = df_enroll.withColumn("DaysToComplete", datediff("CompletionDate", "EnrollDate"))

df_enroll.show()

# COMMAND ----------

#2 User Learning Path Progress

# Group by UserID: count of courses enrolled and avg progress
from pyspark.sql.functions import col, avg, count

df_user_progress = df_enroll.groupBy("UserID").agg(
    count("*").alias("CoursesEnrolled"),
    avg("ProgressPercent").alias("AvgProgress")
)

df_user_progress.show()

# Flag IsCompleted = ProgressPercent == 100
df_enroll = df_enroll.withColumn("IsCompleted", col("ProgressPercent") == 100)
df_enroll.select("EnrollID", "UserID", "ProgressPercent", "IsCompleted").show()

# COMMAND ----------

#3 Engagement Scoring
# Replace null Rating with 0 and create EngagementScore = ProgressPercent * Rating
from pyspark.sql.functions import expr, coalesce

df_enroll = df_enroll.withColumn("Rating", coalesce(col("Rating"), expr("0"))) \
                     .withColumn("EngagementScore", col("ProgressPercent") * col("Rating"))

df_enroll.select("EnrollID", "ProgressPercent", "Rating", "EngagementScore").show()

# COMMAND ----------

#4 Identify Drop-offs
from pyspark.sql.functions import col, trim, when
df_enroll = df_enroll.withColumn(
    "CompletionDate",
    when(trim(col("CompletionDate")) == "", None).otherwise(col("CompletionDate"))
)
# Filter records with ProgressPercent < 50 and CompletionDate is null
df_dropouts = df_enroll.filter(
    (col("ProgressPercent") < 50) & (col("CompletionDate").isNull())
)
# Create a view called Dropouts
df_dropouts.createOrReplaceTempView("Dropouts")
spark.sql("SELECT * FROM Dropouts").show()


# COMMAND ----------

#5 Joins with Metadata

# Create course_catalog as DataFrame
from pyspark.sql import Row

course_catalog = [
    Row(CourseID="C001", Instructor="Abdullah Khan", DurationHours=8, Level="Beginner"),
    Row(CourseID="C002", Instructor="Sana Gupta", DurationHours=5, Level="Beginner"),
    Row(CourseID="C003", Instructor="Ibrahim Khan", DurationHours=10, Level="Intermediate"),
    Row(CourseID="C004", Instructor="Zoya Sheikh", DurationHours=6, Level="Beginner"),
]

df_catalog = spark.createDataFrame(course_catalog)

# Join enrollments with catalog
df_joined = df_enroll.join(df_catalog, on="CourseID", how="left")

# Average progress per instructor
df_joined.groupBy("Instructor").agg(avg("ProgressPercent").alias("AvgProgress")).show()

# Most enrolled course and instructor
df_joined.groupBy("CourseName", "Instructor").agg(count("*").alias("Enrollments")) \
    .orderBy(col("Enrollments").desc()).show(1)

# COMMAND ----------

#6 Delta Lake Practice

# Save as Delta Table
df_enroll.write.format("delta").mode("overwrite").save("/Workspace/Shared/enrollments_delta")

# Update: Set all ratings to 5 where Course = 'Python Basics'
from delta.tables import DeltaTable

delta_table = DeltaTable.forPath(spark, "/Workspace/Shared/enrollments_delta")

delta_table.update(
    condition=col("CourseName") == "Python Basics",
    set={"Rating": expr("5")}
)

# Delete rows where ProgressPercent = 0
delta_table.delete(condition=col("ProgressPercent") == 0)

# Describe Delta history
spark.sql("DESCRIBE HISTORY delta.`/Workspace/Shared/enrollments_delta`").show()


# COMMAND ----------

#7 Window Functions

# dense_rank(): Rank courses by number of enrollments
from pyspark.sql.window import Window
from pyspark.sql.functions import dense_rank

df_course_count = df_enroll.groupBy("CourseID").agg(count("*").alias("EnrollCount"))

w_rank = Window.orderBy(col("EnrollCount").desc())
df_course_ranked = df_course_count.withColumn("Rank", dense_rank().over(w_rank))

df_course_ranked.show()

# lead(): Next course per user sorted by EnrollDate
from pyspark.sql.functions import lead

w_lead = Window.partitionBy("UserID").orderBy("EnrollDate")

df_next_course = df_enroll.withColumn("NextCourse", lead("CourseName").over(w_lead))
df_next_course.select("UserID", "CourseName", "EnrollDate", "NextCourse").show()

# COMMAND ----------

#8 SQL Logic for Dashboard Views

# Create SQL views
df_enroll.createOrReplaceTempView("enrollments")

# View: daily_enrollments
spark.sql("""
    CREATE OR REPLACE TEMP VIEW daily_enrollments AS
    SELECT EnrollDate, COUNT(*) AS TotalEnrollments
    FROM enrollments
    GROUP BY EnrollDate
""")

# View: category_performance
spark.sql("""
    CREATE OR REPLACE TEMP VIEW category_performance AS
    SELECT Category, AVG(Rating) AS AvgRating
    FROM enrollments
    GROUP BY Category
""")

# View: top_3_courses
spark.sql("""
    CREATE OR REPLACE TEMP VIEW top_3_courses AS
    SELECT CourseName, COUNT(*) AS TotalEnrollments
    FROM enrollments
    GROUP BY CourseName
    ORDER BY TotalEnrollments DESC
    LIMIT 3
""")

# Show top 3 courses
spark.sql("SELECT * FROM top_3_courses").show()

# COMMAND ----------

#9 Time Travel and Export Reporting

# Time travel: View previous version
df_v0 = spark.read.format("delta").option("versionAsOf", 0).load("/Workspace/Shared/enrollments_delta")
df_v0.show()

# Export to JSON partitioned by Category
df_enroll.write.mode("overwrite").partitionBy("Category").json("file:/Workspace/Shared/course_json_output")

# Create summary DataFrame and export as Parquet
df_summary = df_enroll.groupBy("CourseName").agg(
    count("*").alias("TotalEnrollments"),
    avg("Rating").alias("AvgRating"),
    avg("ProgressPercent").alias("AvgProgress")
)

df_summary.write.mode("overwrite").parquet("file:/Workspace/Shared/course_summary_parquet")