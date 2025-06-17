# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

#1. Load the CSV using inferred schema

df_auto = spark.read.option("header", "true").option("inferSchema", "true").csv("file:/Workspace/Shared/employee_timesheet.csv")
df_auto.show()
df_auto.printSchema()

# COMMAND ----------

#2. Load the same file with schema explicitly defined
from pyspark.sql.types import *

schema = StructType([
    StructField("EmployeeID", StringType()),
    StructField("Name", StringType()),
    StructField("Department", StringType()),
    StructField("Project", StringType()),
    StructField("WorkHours", IntegerType()),
    StructField("WorkDate", DateType()),
    StructField("Location", StringType()),
    StructField("Mode", StringType())
])

df_manual = spark.read.option("header", "true").schema(schema).csv("file:/Workspace/Shared/employee_timesheet.csv")
df_manual.show()


# COMMAND ----------

#3. Add a new column Weekday extracted from WorkDate

from pyspark.sql.functions import date_format

df = df_manual.withColumn("Weekday", date_format("WorkDate", "EEEE"))
df.show()

# COMMAND ----------

#4. Calculate total work hours by employee

from pyspark.sql.functions import sum

df.groupBy("EmployeeID", "Name").agg(sum("WorkHours").alias("TotalHours")).show()

# COMMAND ----------

#5. Calculate average work hours per department
from pyspark.sql.functions import avg

df.groupBy("Department").agg(avg("WorkHours").alias("AvgHours")).show()

# COMMAND ----------

#6. Get top 2 employees by total hours using window function
from pyspark.sql.window import Window
from pyspark.sql.functions import rank

windowSpec = Window.orderBy(df["WorkHours"].desc())
df.withColumn("Rank", rank().over(windowSpec)).filter("Rank <= 2").show()


# COMMAND ----------

#7. Filter entries where WorkDate falls on a weekend
from pyspark.sql.functions import dayofweek

df.filter(dayofweek("WorkDate").isin([1, 7])).show()  # Sunday=1, Saturday=7

# COMMAND ----------

#8. Running total of hours per employee using window

from pyspark.sql.functions import sum
from pyspark.sql.window import Window

windowSpec = Window.partitionBy("EmployeeID").orderBy("WorkDate").rowsBetween(Window.unboundedPreceding, 0)
df.withColumn("RunningTotal", sum("WorkHours").over(windowSpec)).show()

# COMMAND ----------

#9. Create department_location.csv (manually using DataFrame)
from pyspark.sql import Row

dept_data = [Row(Department="IT", DeptHead="Anand"),
             Row(Department="HR", DeptHead="Shruti"),
             Row(Department="Finance", DeptHead="Kamal")]

df_dept = spark.createDataFrame(dept_data)
df_dept.show()

# COMMAND ----------

#10. Join with timesheet data and list all employees with their DeptHead

df.join(df_dept, on="Department", how="left").select("EmployeeID", "Name", "Department", "DeptHead").show()


# COMMAND ----------

#11. Pivot table: total hours per employee per project

df.groupBy("EmployeeID").pivot("Project").sum("WorkHours").show()

# COMMAND ----------

#12. Unpivot example: Convert mode-specific hours into rows

from pyspark.sql.functions import expr

# Assume these are the pivoted columns; create manually
pivoted = df.groupBy("EmployeeID").pivot("Mode").sum("WorkHours").fillna(0)
unpivoted = pivoted.selectExpr("EmployeeID", "stack(2, 'Remote', Remote, 'Onsite', Onsite) as (Mode, Hours)")
unpivoted.show()

# COMMAND ----------

#13. Create UDF to classify work hours
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType

def workload_tag(hours):
    if hours >= 8:
        return "Full"
    elif hours >= 4:
        return "Partial"
    else:
        return "Light"

workload_udf = udf(workload_tag, StringType())
df.withColumn("WorkloadCategory", workload_udf("WorkHours")).show()

# COMMAND ----------

#14. Add WorkloadCategory using this UDF
df.withColumn("WorkloadCategory", workload_udf("WorkHours")).show()

# COMMAND ----------

#15. Introduce nulls in Mode column (for demonstration)

df_null = df.withColumn("Mode", expr("CASE WHEN EmployeeID = 'E102' THEN NULL ELSE Mode END"))
df_null.show()

# COMMAND ----------

#16. Fill nulls with "Not Provided"
df_filled = df_null.fillna({"Mode": "Not Provided"})
df_filled.show()

# COMMAND ----------

#17. Drop rows where WorkHours < 4

df_filtered = df.filter(df.WorkHours >= 4)
df_filtered.show()

# COMMAND ----------

#18. Mark "Remote Worker" if >80% entries are Remote
from pyspark.sql.functions import count, when

df.groupBy("EmployeeID").agg(
    (sum(when(df.Mode == "Remote", 1).otherwise(0)) / count("*")).alias("RemoteRatio")
).withColumn("RemoteWorker", when(expr("RemoteRatio >= 0.8"), "Yes").otherwise("No")).show()


# COMMAND ----------

#19. Add new column ExtraHours where hours > 8
from pyspark.sql.functions import when

df.withColumn("ExtraHours", when(df.WorkHours > 8, df.WorkHours - 8).otherwise(0)).show()

# COMMAND ----------

#20. Append dummy timesheet using unionByName()
from pyspark.sql.functions import lit
from pyspark.sql import Row

new_data = [("E999", "Intern1", "IT", "Alpha", 5, "2024-05-05", "Chennai", "Onsite")]
columns = ["EmployeeID", "Name", "Department", "Project", "WorkHours", "WorkDate", "Location", "Mode"]

df_dummy = spark.createDataFrame(new_data, columns)
df_dummy = df_dummy.withColumn("WorkDate", df_dummy["WorkDate"].cast("date"))

df_combined = df.unionByName(df_dummy, allowMissingColumns=True)
df_combined.show()


# COMMAND ----------

#21. Remove duplicate rows

df_combined.dropDuplicates().show()