# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

#1. Ingest the CSV files into two PySpark DataFrames
# Read customers.csv
df_customers = spark.read.option("header", True).option("inferSchema", True).csv("file:/Workspace/Shared/customers.csv")

# Read orders.csv
df_orders = spark.read.option("header", True).option("inferSchema", True).csv("file:/Workspace/Shared/orders.csv")

# COMMAND ----------

#2. Infer schema and print the schema for both
# Schema for customers
df_customers.printSchema()

# Schema for orders
df_orders.printSchema()

# COMMAND ----------

#3. Add a column TotalAmount = Quantity * Price to orders
from pyspark.sql.functions import col

df_orders = df_orders.withColumn("TotalAmount", col("Quantity") * col("Price"))
df_orders.show()

# COMMAND ----------

#4. Join both DataFrames on CustomerID
df_joined = df_orders.join(df_customers, on="CustomerID", how="inner")
df_joined.show()

# COMMAND ----------

#5. Filter orders where TotalAmount > 20000
df_filtered = df_joined.filter(col("TotalAmount") > 20000)
df_filtered.show()

# COMMAND ----------

#6. Show customers who placed more than 1 order
from pyspark.sql.functions import count

df_order_count = df_orders.groupBy("CustomerID").agg(count("*").alias("OrderCount")).filter("OrderCount > 1")
df_order_count.show()

# COMMAND ----------

#7. Group orders by City and get average order value
from pyspark.sql.functions import avg

df_avg_city = df_joined.groupBy("City").agg(avg("TotalAmount").alias("AverageOrderValue"))
df_avg_city.show()

# COMMAND ----------

#8. Sort orders by OrderDate in descending order
df_sorted = df_joined.orderBy(col("OrderDate").desc())
df_sorted.show()

# COMMAND ----------

#9. Write the final result as a Parquet file partitioned by City
df_joined.write.mode("overwrite").partitionBy("City").parquet("/dbfs/FileStore/orders_partitioned_by_city")


# COMMAND ----------

#10. Create a temporary view and run Spark SQL
# Register temp view
df_joined.createOrReplaceTempView("orders_view")

# COMMAND ----------

#Total sales by customer
spark.sql("""
SELECT Name, SUM(TotalAmount) AS TotalSales
FROM orders_view
GROUP BY Name
""").show()

# COMMAND ----------

#Count of products per city
spark.sql("""
SELECT City, COUNT(Product) AS ProductCount
FROM orders_view
GROUP BY City
""").show()

# COMMAND ----------

#Top 2 cities by revenue
spark.sql("""
SELECT City, SUM(TotalAmount) AS Revenue
FROM orders_view
GROUP BY City
ORDER BY Revenue DESC
LIMIT 2""").show()
