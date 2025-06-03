#!/bin/bash
set -e

: "${SPARK_MASTER_URL:=spark://spark-master:7077}"

echo "Starting Spark worker, connecting to $SPARK_MASTER_URL"

exec $SPARK_HOME/bin/spark-class org.apache.spark.deploy.worker.Worker \
  --cores ${SPARK_WORKER_CORES:-2} \
  --memory ${SPARK_WORKER_MEMORY:-1g} \
  $SPARK_MASTER_URL

