#!/bin/bash -e

IMAGE=${1?"Usage: $0 IMAGE[:TAG]"}

CONTAINER_ID=$(docker run --rm -d --entrypoint "" "$IMAGE" /bin/sh -c "while true; do echo hello world; sleep 1; done")
docker run --rm  -v /var/run/docker.sock:/var/run/docker.sock puppet/lumogon scan "$CONTAINER_ID"
docker kill "$CONTAINER_ID"
