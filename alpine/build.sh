#!/usr/bin/env bash

docker build --no-cache -t nonameffh/alpine:3.8 3.8
docker build --no-cache -t nonameffh/alpine:3.9 3.9
docker build --no-cache -t nonameffh/alpine:latest 3.9

docker push nonameffh/alpine:3.8
docker push nonameffh/alpine:3.9
docker push nonameffh/alpine:latest