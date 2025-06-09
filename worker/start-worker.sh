#!/bin/bash
set -e

echo "Starting Spark worker with ${SPARK_WORKER_CORES:-2} cores and ${SPARK_WORKER_MEMORY:-2g}, connecting to ${SPARK_MASTER_URL}"

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker \
  --cores "${SPARK_WORKER_CORES:-2}" \
  --memory "${SPARK_WORKER_MEMORY:-2g}" \
  "${SPARK_MASTER_URL}"

