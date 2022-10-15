#!/usr/bin/env sh

docker run --rm -it -v $PWD/$1:/demo -w /demo mis-code-ception
