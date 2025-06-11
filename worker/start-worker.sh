#!/bin/bash
set -e

# Dynamically determine the worker's LAN IP
export SPARK_LOCAL_IP=$(ip route get ${SPARK_MASTER_HOST:-192.168.0.32} | awk '/src/ { print $7; exit }')
export SPARK_PUBLIC_DNS=$SPARK_LOCAL_IP

echo "Detected local IP: $SPARK_LOCAL_IP"
echo "Starting Spark worker with SPARK_LOCAL_IP=$SPARK_LOCAL_IP \n with ${SPARK_WORKER_CORES:-2} cores and ${SPARK_WORKER_MEMORY:-2g}" 
echo "Connecting to ${SPARK_MASTER_URL}"

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker \
  --cores "${SPARK_WORKER_CORES:-2}" \
  --memory "${SPARK_WORKER_MEMORY:-2g}" \
  "${SPARK_MASTER_URL}"

