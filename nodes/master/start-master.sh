#!/bin/bash
set -e

echo "Starting Spark master in foreground"

exec $SPARK_HOME/bin/spark-class org.apache.spark.deploy.master.Master \
  --host 0.0.0.0 \
  --port 7077 \
  --webui-port 8080

