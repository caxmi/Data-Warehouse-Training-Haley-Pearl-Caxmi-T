# Databricks notebook source
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()
spark

# COMMAND ----------

data = [
    ("Ananya", "HR", 52000),
    ("Rahul", "Engineering", 65000),
    ("Priya", "Engineering", 60000),
    ("Zoya", "Marketing", 48000),
    ("Karan", "HR", 53000),
    ("Naveen", "Engineering", 70000),
    ("Fatima", "Marketing", 45000)
]
columns = ["Name", "Department", "Salary"]
df_emp = spark.createDataFrame(data, columns)

# COMMAND ----------

performance = [
    ("Ananya", 2023, 4.5),
    ("Rahul", 2023, 4.9),
    ("Priya", 2023, 4.3),
    ("Zoya", 2023, 3.8),
    ("Karan", 2023, 4.1),
    ("Naveen", 2023, 4.7),
    ("Fatima", 2023, 3.9)
]
columns_perf = ["Name", "Year", "Rating"]
df_perf = spark.createDataFrame(performance, columns_perf)

# COMMAND ----------

# 1. Get the average salary by department.
from pyspark.sql.functions import avg

df_emp.groupBy("Department").agg(avg("Salary").alias("Avg_Salary")).show()


# COMMAND ----------

# 2. Count of employees per department.
from pyspark.sql.functions import count

df_emp.groupBy("Department").agg(count("*").alias("Employee_Count")).show()


# COMMAND ----------

# 3. Maximum and minimum salary in Engineering.
from pyspark.sql.functions import max, min

df_emp.filter(df_emp.Department == "Engineering") \
    .agg(
        max("Salary").alias("Max_Salary"),
        min("Salary").alias("Min_Salary")
    ).show()


# COMMAND ----------

# 4. Perform an inner join between employee_data and performance_data on Name.
df_joined = df_emp.join(df_perf, on="Name", how="inner")
df_joined.show()


# COMMAND ----------

# 5. Show each employee’s salary and performance rating.
df_joined.select("Name", "Salary", "Rating").show()


# COMMAND ----------

# 6. Filter employees with rating > 4.5 and salary > 60000.
df_joined.filter((df_joined.Rating > 4.5) & (df_joined.Salary > 60000)).show()


# COMMAND ----------

# 7. Rank employees by salary department-wise.
from pyspark.sql.window import Window
from pyspark.sql.functions import rank

window_spec = Window.partitionBy("Department").orderBy(df_emp["Salary"].desc())

df_ranked = df_emp.withColumn("Rank", rank().over(window_spec))
df_ranked.show()


# COMMAND ----------

# 8. Calculate cumulative salary in each department.
from pyspark.sql.functions import sum

window_spec_cum = Window.partitionBy("Department").orderBy("Salary").rowsBetween(Window.unboundedPreceding, 0)

df_cumsum = df_emp.withColumn("CumulativeSalary", sum("Salary").over(window_spec_cum))
df_cumsum.show()


# COMMAND ----------

# 9. Add a new column JoinDate with random dates between 2020 and 2023.
from pyspark.sql.functions import expr

df_dates = df_emp.withColumn("JoinDate", expr(
    "CASE Name " +
    "WHEN 'Ananya' THEN DATE('2020-06-01') " +
    "WHEN 'Rahul' THEN DATE('2021-03-15') " +
    "WHEN 'Priya' THEN DATE('2022-01-20') " +
    "WHEN 'Zoya' THEN DATE('2023-07-12') " +
    "WHEN 'Karan' THEN DATE('2020-11-05') " +
    "WHEN 'Naveen' THEN DATE('2021-12-25') " +
    "WHEN 'Fatima' THEN DATE('2022-08-09') " +
    "END"
))
df_dates.show()


# COMMAND ----------

# 10. Add column YearsWithCompany using current_date() and datediff().
from pyspark.sql.functions import current_date, datediff

df_years = df_dates.withColumn("YearsWithCompany", (datediff(current_date(), "JoinDate") / 365).cast("int"))
df_years.show()


# COMMAND ----------

# 11. Write the full employee DataFrame to CSV with headers.
df_emp.write.mode("overwrite").option("header", "true").csv("/tmp/employee_data_csv")


# COMMAND ----------

# 12. Save the joined DataFrame to a Parquet file.
df_joined.write.mode("overwrite").parquet("/tmp/employee_performance_parquet")


# COMMAND ----------

df_read = spark.read.option("header", "true").csv("dbfs:/tmp/employee_data_csv")
df_read.show()


# COMMAND ----------

df_read = spark.read.option("header", "true").parquet("dbfs:/tmp/employee_performance_parquet")
df_read.show()