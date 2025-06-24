#!/bin/bash
set -e

echo "Starting Spark master at 192.168.0.32:7077"

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master \
  --port 7077 \
  --webui-port 8080

