#!/usr/bin/env bash

JAVA_FILE="$1"

if [ -z "$JAVA_FILE" ]; then
  echo "❌ Usage: ./run-software-acceleration.sh <YourJavaFile.java>"
  exit 1
fi

if [[ "$JAVA_FILE" = /* ]]; then
  # Absolute path provided
  MOUNT_DIR=$(dirname "$JAVA_FILE")
  MOUNT_FILE="/data/$(basename "$JAVA_FILE")"
else
  # Relative path or just a file name
  MOUNT_DIR="$PWD"
  MOUNT_FILE="/data/$JAVA_FILE"
fi

docker run -it \
  --rm \
  --gpus all \
  --runtime=nvidia \
  -v "$MOUNT_DIR":/data \
  -p 8080:8080 \
  beehivelab/p2code-software-acceleration-container:latest "$MOUNT_FILE"
