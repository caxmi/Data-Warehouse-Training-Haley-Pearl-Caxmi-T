# Databricks notebook source
from pyspark.sql import SparkSession
spark

# COMMAND ----------

#Load both datasets with schema inference
df_subs = spark.read.option("header", "true").option("inferSchema", "true") \
    .csv("file:/Workspace/Shared/subscriptions.csv")

df_activity = spark.read.option("header", "true").option("inferSchema", "true") \
    .csv("file:/Workspace/Shared/user_activity.csv")

df_subs.show()
df_activity.show()

# COMMAND ----------

#A – Subscription Engagement Score
from pyspark.sql.functions import col, count, datediff

df_subs_engaged = df_subs.withColumn("active_days", datediff("EndDate", "StartDate"))

df_events_per_user = df_activity.groupBy("UserID") \
    .agg(count("EventType").alias("events_per_user"))

df_engagement = df_subs_engaged.join(df_events_per_user, "UserID", "left") \
    .withColumn("engagement_score", (col("events_per_user") / col("active_days")) * col("PriceUSD"))

df_engagement.show()

# COMMAND ----------

# B - Anomaly Detection via SQL
#Users who have inactive subscriptions but recent activity
#Users who have AutoRenew = true but no activity in last 30 days
df_subs.createOrReplaceTempView("subscriptions")
df_activity.createOrReplaceTempView("user_activity")


spark.sql("""
CREATE OR REPLACE TEMP VIEW anomaly_users_combined AS
(
    SELECT DISTINCT s.UserID, 'InactiveButActive' AS AnomalyType
    FROM subscriptions s
    JOIN user_activity u ON s.UserID = u.UserID
    WHERE s.IsActive = false

    UNION

    SELECT s.UserID, 'AutoRenewNoActivity30Days' AS AnomalyType
    FROM subscriptions s
    LEFT JOIN user_activity u ON s.UserID = u.UserID
    WHERE s.AutoRenew = true
    GROUP BY s.UserID
    HAVING MAX(to_timestamp(u.EventTime)) < current_timestamp() - INTERVAL 30 DAYS
           OR MAX(to_timestamp(u.EventTime)) IS NULL
)
""")

# View anomalies
spark.sql("SELECT * FROM anomaly_users_combined").show()



# COMMAND ----------

#C – Delta Lake Merge Simulation (Pro Plan Price Fix)
from pyspark.sql.functions import month, lit

# Save to Delta
df_subs.write.format("delta").mode("overwrite") \
    .save("/Workspace/Shared/delta_subscriptions")

# Load from Delta
df_delta = spark.read.format("delta").load("/Workspace/Shared/delta_subscriptions")
df_delta.createOrReplaceTempView("delta_subscriptions")

# Create fix DataFrame
df_fix = df_delta.filter((col("PlanType") == "Pro") & (month("StartDate") == 3)) \
    .withColumn("PriceUSD", col("PriceUSD") + lit(5))

df_fix.createOrReplaceTempView("fix_table")
df_fix.show()
# Apply merge
spark.sql("""
MERGE INTO delta_subscriptions AS main
USING fix_table AS fix
ON main.SubscriptionID = fix.SubscriptionID
WHEN MATCHED THEN UPDATE SET main.PriceUSD = fix.PriceUSD
""")

# COMMAND ----------

#D – Time Travel Debugging
# View Delta version history
spark.sql("DESCRIBE HISTORY delta.`/Workspace/Shared/delta_subscriptions`").show()

# Read before merge using version
df_old = spark.read.format("delta").option("versionAsOf", 0) \
    .load("/Workspace/Shared/delta_subscriptions")

df_old.show()

# COMMAND ----------

#E – Tier Migration (Basic → Pro → Premium)
from pyspark.sql.window import Window
from pyspark.sql.functions import lag

win = Window.partitionBy("UserID").orderBy("StartDate")

# Detect plan migration
df_migration = df_subs.withColumn("prev_plan", lag("PlanType").over(win))

# Filter: Basic to Pro, or Pro to Premium
df_migration.filter(
    ((col("prev_plan") == "Basic") & (col("PlanType") == "Pro")) |
    ((col("prev_plan") == "Pro") & (col("PlanType") == "Premium"))
).select("UserID", "prev_plan", "PlanType", "StartDate").show()

# COMMAND ----------

#F – Power Users Detection
from pyspark.sql.functions import countDistinct, sum

# Power user = Used ≥2 features and logged in ≥3 times
df_power_users = df_activity.groupBy("UserID") \
    .agg(
        countDistinct("FeatureUsed").alias("features_used"),
        sum((col("EventType") == "login").cast("int")).alias("login_count")
    ).filter((col("features_used") >= 2) & (col("login_count") >= 3))

# Save to Delta table
df_power_users.write.format("delta").mode("overwrite") \
    .save("/Workspace/Shared/power_users")

df_power_users.show()

# COMMAND ----------

#G – Session Replay View (Session Duration)

from pyspark.sql.functions import when,unix_timestamp

window_spec = Window.partitionBy("UserID").orderBy("EventTime")

df_session = df_activity.withColumn("event_ts", unix_timestamp("EventTime")) \
    .withColumn("prev_ts", lag("event_ts").over(window_spec)) \
    .withColumn("prev_event", lag("EventType").over(window_spec)) \
    .withColumn("session_secs", 
                when(col("EventType") == "logout", col("event_ts") - col("prev_ts"))) \
    .filter(col("EventType") == "logout")

df_session.select("UserID", "prev_event", "EventTime", "session_secs").show()