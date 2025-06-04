#!/bin/bash
pyspark \
  --master spark://spark-master:7077 \
  --conf spark.driver.host=spark-master \
  --conf spark.driver.bindAddress=0.0.0.0 \
  --conf spark.executor.memory=512m \
  --conf spark.driver.memory=512m