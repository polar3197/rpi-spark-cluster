#!/bin/bash

WORKERS=(caddy quentin)
LOCAL_PROJECT_DIR="$HOME/Code/projects/rpi-cluster"
REMOTE_PROJECT_DIR="~/rpi-spark-cluster"

ACTION="$1"

if [[ "$ACTION" == "-up" ]]; then
  
  echo "Starting Spark master on Mac..."
  cd "$LOCAL_PROJECT_DIR" || exit 1
  docker compose up -d --build --rm spark-master

  for WORKER in "${WORKERS[@]}"; do
    echo "Starting Spark worker on $WORKER..."
    ssh "$WORKER" "cd $REMOTE_PROJECT_DIR && docker compose up -d --build --rm spark-worker"
  done

  echo "Spark cluster started."

elif [[ "$ACTION" == "-down" ]]; then
  echo "Stopping Spark master on Mac..."
  cd "$LOCAL_PROJECT_DIR" || exit 1
  docker compose down

  for WORKER in "${WORKERS[@]}"; do
    echo "Stopping Spark worker on $WORKER..."
    ssh "$WORKER" "cd $REMOTE_PROJECT_DIR && docker compose down"
  done

  echo "Spark cluster stopped."

else
  echo "Usage: $0 -up | -down"
  exit 1
fi