#!/bin/sh
run () {
	docker run \
		--rm \
		-v "${PWD}":"/home/node/app" \
		-u node \
		--sig-proxy=true \
	  --pid=host \
		laurentgoderre/docker-tools:json-diff-patch $@
}
