# Databricks notebook source
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Databricks Shell") \
    .getOrCreate()
spark

# COMMAND ----------

# Load the Dataset
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

df = spark.createDataFrame(data, columns)

# COMMAND ----------

# 1. Display all records in the DataFrame.
df.show()

# COMMAND ----------

# 2. Print the schema of the DataFrame.
df.printSchema()

# COMMAND ----------

# 3. Count total number of employees.
df.count()

# COMMAND ----------

# 4. Add a new column Bonus which is 15% of Salary.
from pyspark.sql.functions import col

df_bonus = df.withColumn("Bonus", col("Salary") * 0.15)
df_bonus.show()

# COMMAND ----------

# 5. Add a new column NetPay = Salary + Bonus.
df_netpay = df_bonus.withColumn("NetPay", col("Salary") + col("Bonus"))
df_netpay.show()

# COMMAND ----------

# 6. Display only employees from the “Engineering” department.
from pyspark.sql.functions import col

df.filter(col("Department") == "Engineering").show()

# COMMAND ----------

# 7. Display employees whose salary is greater than 60000.
from pyspark.sql.functions import col

df.filter(col("Salary") > 60000).show()


# COMMAND ----------

# 8. Display employees who are not in the “Marketing” department.
from pyspark.sql.functions import col

df.filter(col("Department") != "Marketing").show()


# COMMAND ----------

# 9. Show top 3 highest paid employees.
from pyspark.sql.functions import col

df.orderBy(col("Salary").desc()).show(3)


# COMMAND ----------

# 10. Sort the data by Department ascending and Salary descending.
from pyspark.sql.functions import col

df.orderBy(col("Department").asc(), col("Salary").desc()).show()


# COMMAND ----------

# 11. Add a new column Level:
#     “Senior” if salary > 60000
#     “Mid” if salary between 50000 and 60000
#     “Junior” otherwise
from pyspark.sql.functions import when, col

df_level = df.withColumn(
    "Level",
    when(col("Salary") > 60000, "Senior")
    .when((col("Salary") >= 50000) & (col("Salary") <= 60000), "Mid")
    .otherwise("Junior")
)
df_level.show()


# COMMAND ----------

# 12. Convert all names to uppercase.
from pyspark.sql.functions import upper, col

df_upper = df.withColumn("Name", upper(col("Name")))
df_upper.show()
