#!/bin/bash
set -e

# Source environment
. "${SPARK_HOME}/conf/spark-env.sh"

echo "Starting Spark worker with SPARK_LOCAL_IP=${SPARK_LOCAL_IP:-0.0.0.0}"
echo "Connecting to ${SPARK_MASTER_URL}"

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker \
  --host "${SPARK_LOCAL_IP:-0.0.0.0}" \
  "${SPARK_MASTER_URL}"