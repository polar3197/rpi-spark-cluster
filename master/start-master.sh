#!/bin/bash
set -e

echo "Starting Spark master at 192.168.0.32:7077"

if [ -f "${SPARK_HOME}/conf/spark-env.sh" ]; then
  . "${SPARK_HOME}/conf/spark-env.sh"
fi

exec ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master \
  --host 0.0.0.0 \
  --ip "$SPARK_PUBLIC_DNS" \
  --port 7077 \
  --webui-port 8080

