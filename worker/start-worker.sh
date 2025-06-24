#!/bin/bash
set -e

# Source and export environment variables from spark-env.sh
set -a  # Automatically export all variables
. "${SPARK_HOME}/conf/spark-env.sh"
set +a

echo "Starting Spark worker with SPARK_LOCAL_IP=$SPARK_LOCAL_IP"
echo "Connecting to ${SPARK_MASTER_URL}"

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker \
  --host "$SPARK_LOCAL_IP" \
  "${SPARK_MASTER_URL}"