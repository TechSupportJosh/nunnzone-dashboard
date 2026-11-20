#!/bin/sh
# Build and push to container.nunn.zone (assumes `docker login container.nunn.zone` already done)
set -e
IMAGE=container.nunn.zone/nunnzone-dashboard
TAG=${1:-latest}
docker build -t "$IMAGE:$TAG" .
docker push "$IMAGE:$TAG"
