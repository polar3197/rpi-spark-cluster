#!/bin/bash
set -e

echo "Starting Spark master at ${SPARK_MASTER_HOST:-localhost}:7077"

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master \
  --host "${SPARK_MASTER_HOST:-localhost}" \
  --port 7077 \
  --webui-port 8080

