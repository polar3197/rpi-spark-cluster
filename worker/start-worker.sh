#!/bin/bash
set -e

echo "Starting Spark worker with SPARK_LOCAL_IP=${SPARK_LOCAL_IP:-0.0.0.0}"

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker \
  --host "${SPARK_LOCAL_IP:-0.0.0.0}" \
  "${SPARK_MASTER_URL}"