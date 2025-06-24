#!/bin/bash
set -e

echo "Starting Spark master"

# Source and export environment variables from spark-env.sh
set -a  # Automatically export all variables
. "${SPARK_HOME}/conf/spark-env.sh"
set +a

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master \
  --host 0.0.0.0 \
  # --ip "$SPARK_PUBLIC_DNS" \
  --port 7077 \
  --webui-port 8080

