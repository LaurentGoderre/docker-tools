#!/bin/sh
run () {
  docker run \
    --rm \
    --sig-proxy=true \
    --pid=host \
    -v "${PWD}":"/home/node/app" \
    -u node \
    laurentgoderre/docker-tools:json-diff-patch $@
}
