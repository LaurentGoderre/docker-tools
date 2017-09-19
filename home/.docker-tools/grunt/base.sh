#!/bin/bash
if ! type docker > /dev/null; then
  echo "Docker is required to be present on $PATH"
  exit 0
fi


docker build \
   -t node-grunt-bower \
   --build-arg http_proxy="$HTTP_PROXY" \
   --build-arg HTTP_PROXY="$HTTP_PROXY" \
   --build-arg https_proxy="$HTTP_PROXY" \
   --build-arg HTTPS_PROXY="$HTTP_PROXY" \
   $src

run () {
	docker run -it \
	  -v "${PWD}":"/home/node/app" \
	  -w "/home/node/app" \
	  -u node \
	  -v /tmp/:/tmp/ \
	  -v $HOME/.gitconfig:/home/node/.gitconfig \
      -v $HOME/.npmrc:/home/node/.npmrc \
	  -v $HOME/.netrc:/home/node/.netrc \
	  -e HTTP_PROXY=$HTTP_PROXY \
	  -e HTTPS_PROXY=$HTTP_PROXY \
	  -e http_proxy=$HTTP_PROXY \
	  -e https_proxy=$HTTP_PROXY \
	  --sig-proxy=true \
	  --pid=host \
	  --rm \
	  $extra_params \
	  node-grunt-bower $@
}
