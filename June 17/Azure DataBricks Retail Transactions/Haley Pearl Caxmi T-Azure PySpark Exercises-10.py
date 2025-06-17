# Databricks notebook source
from pyspark.sql import SparkSession
spark 

# COMMAND ----------

#1. Load retail_data.csv into a PySpark DataFrame and display schema

df_retail = spark.read.option("header", "true").option("inferSchema", "true") \
    .csv("file:/Workspace/Shared/retail_data.csv")

df_retail.printSchema()
df_retail.show()

# COMMAND ----------

#2. Infer schema as False — then manually cast columns
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

manual_schema = StructType([
    StructField("TransactionID", StringType(), True),
    StructField("Customer", StringType(), True),
    StructField("City", StringType(), True),
    StructField("Product", StringType(), True),
    StructField("Category", StringType(), True),
    StructField("Quantity", IntegerType(), True),
    StructField("UnitPrice", IntegerType(), True),
    StructField("TotalPrice", IntegerType(), True),
    StructField("TransactionDate", StringType(), True),
    StructField("PaymentMode", StringType(), True)
])

df_manual = spark.read.option("header", "true").schema(manual_schema) \
    .csv("file:/Workspace/Shared/retail_data.csv")

df_manual.printSchema()

# COMMAND ----------

#3. Filter transactions where TotalPrice > 40000
df_retail.filter(df_retail.TotalPrice > 40000).show()

# COMMAND ----------

#4. Get unique cities from the dataset

df_retail.select("City").distinct().show()

# COMMAND ----------

#5. Find all transactions from "Delhi" using .filter() and .where()
# Using filter()
df_retail.filter(df_retail.City == "Delhi").show()

# Using where()
df_retail.where(df_retail.City == "Delhi").show()

# COMMAND ----------

#6. Add a column DiscountedPrice = TotalPrice - 10%
from pyspark.sql.functions import col

df_retail = df_retail.withColumn("DiscountedPrice", col("TotalPrice") * 0.9)
df_retail.select("TransactionID", "TotalPrice", "DiscountedPrice").show()


# COMMAND ----------

#7. Rename TransactionDate to TxnDate

df_retail = df_retail.withColumnRenamed("TransactionDate", "TxnDate")
df_retail.printSchema()

# COMMAND ----------

#8. Drop the column UnitPrice
df_retail = df_retail.drop("UnitPrice")
df_retail.printSchema()

# COMMAND ----------

#9. Get total sales by city
df_retail.groupBy("City").sum("TotalPrice").withColumnRenamed("sum(TotalPrice)", "TotalSales").show()

# COMMAND ----------

#10. Get average unit price by category (need original with UnitPrice)

df_full = spark.read.option("header", "true").option("inferSchema", "true") \
    .csv("file:/Workspace/Shared/retail_data.csv")

df_full.groupBy("Category").avg("UnitPrice").withColumnRenamed("avg(UnitPrice)", "AvgUnitPrice").show()


# COMMAND ----------

#11. Count of transactions grouped by PaymentMode

df_retail.groupBy("PaymentMode").count().show()


# COMMAND ----------

#12. Rank transactions by TotalPrice within each City
from pyspark.sql.window import Window
from pyspark.sql.functions import rank

win_spec = Window.partitionBy("City").orderBy(col("TotalPrice").desc())

df_retail.withColumn("Rank", rank().over(win_spec)).select("TransactionID", "City", "TotalPrice", "Rank").show()

# COMMAND ----------

#13. Use lag() to get previous transaction amount per city

from pyspark.sql.functions import lag

win_spec_lag = Window.partitionBy("City").orderBy("TxnDate")

df_retail.withColumn("PrevAmount", lag("TotalPrice").over(win_spec_lag)) \
    .select("TransactionID", "City", "TotalPrice", "PrevAmount").show()

# COMMAND ----------

#14. Create a second DataFrame: city_region
from pyspark.sql import Row

city_region = spark.createDataFrame([
    Row(City="Mumbai", Region="West"),
    Row(City="Delhi", Region="North"),
    Row(City="Bangalore", Region="South"),
    Row(City="Hyderabad", Region="South")
])
city_region.show()

# COMMAND ----------

#15. Join and get total sales by Region

df_joined = df_retail.join(city_region, on="City", how="left")
df_joined.groupBy("Region").sum("TotalPrice").withColumnRenamed("sum(TotalPrice)", "TotalSales").show()

# COMMAND ----------

#16. Introduce nulls and replace them
# Introduce nulls (simulate for demo)
from pyspark.sql.functions import when

df_nulls = df_retail.withColumn("Quantity", when(df_retail.TransactionID == "T1002", None).otherwise(df_retail.Quantity))

# Replace with default values
df_cleaned = df_nulls.fillna({"Quantity": 1})
df_cleaned.show()

# COMMAND ----------

#17. Drop rows where Quantity is null
df_cleaned = df_nulls.na.drop(subset=["Quantity"])
df_cleaned.show()

# COMMAND ----------

#18. Fill null PaymentMode with "Unknown"

df_filled = df_cleaned.fillna({"PaymentMode": "Unknown"})
df_filled.select("TransactionID", "PaymentMode").show()

# COMMAND ----------

#19. Label orders using UDF
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType

def label_order(amount):
    if amount > 50000:
        return "High"
    elif amount >= 30000:
        return "Medium"
    else:
        return "Low"

label_udf = udf(label_order, StringType())

df_labeled = df_filled.withColumn("OrderLabel", label_udf(col("TotalPrice")))
df_labeled.select("TransactionID", "TotalPrice", "OrderLabel").show()

# COMMAND ----------

#20. Extract year, month, and day from TxnDate

from pyspark.sql.functions import year, month, dayofmonth, to_date

df_dates = df_labeled.withColumn("TxnDate", to_date("TxnDate"))
df_dates = df_dates.withColumn("Year", year("TxnDate")) \
                   .withColumn("Month", month("TxnDate")) \
                   .withColumn("Day", dayofmonth("TxnDate"))
df_dates.select("TransactionID", "TxnDate", "Year", "Month", "Day").show()

# COMMAND ----------

#Q21. Filter transactions in February
df_dates.filter(month("TxnDate") == 2).show()

# COMMAND ----------

#22. Duplicate using union() and remove duplicates
df_union = df_dates.union(df_dates)
df_distinct = df_union.dropDuplicates()
df_distinct.show()
