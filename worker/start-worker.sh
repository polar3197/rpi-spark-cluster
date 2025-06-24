#!/bin/bash
set -e

echo "Starting Spark worker with SPARK_LOCAL_IP=$SPARK_LOCAL_IP"
echo "Connecting to ${SPARK_MASTER_URL}"

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker \
  --host "$SPARK_LOCAL_IP" \
  "${SPARK_MASTER_URL}"