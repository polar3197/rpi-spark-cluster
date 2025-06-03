#!/usr/bin/env bash

# Common settings
export SPARK_WORKER_CORES=1
export SPARK_WORKER_MEMORY=512m
export SPARK_DRIVER_MEMORY=512m

# Only the master needs this
export SPARK_MASTER_HOST=spark-master

# Optional: sets web UI port (8080 for master, 8081+ for workers)
export SPARK_MASTER_WEBUI_PORT=8080
export SPARK_WORKER_WEBUI_PORT=8081