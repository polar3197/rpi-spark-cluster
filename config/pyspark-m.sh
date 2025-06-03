#!/bin/bash
pyspark \
  --master spark://192.168.0.32:7077 \
  --conf spark.driver.host=spark-master \
  --conf spark.driver.bindAddress=0.0.0.0 \
  --conf spark.executor.memory=512m \
  --conf spark.driver.memory=512m