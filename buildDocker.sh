#!/usr/bin/env bash

TAG_VERSION=1.1.0
IMAGE=p2code-software-acceleration-container

docker build --progress=plain --no-cache -t $IMAGE -f Dockerfile.nvidia.jdk21.p2code .
docker tag $IMAGE beehivelab/$IMAGE:$TAG_VERSION
docker tag $IMAGE beehivelab/$IMAGE:latest
