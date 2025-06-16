# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

import dlt

# Create Delta Table for Orders
@dlt.table
def orders():
    return spark.read.option("header", True).option("inferSchema", True).csv("file:/Workspace/Shared/orders.csv")

# Create Delta Table for Customers
@dlt.table
def customers():
    return spark.read.option("header", True).option("inferSchema", True).csv("file:/Workspace/Shared/customers.csv")
