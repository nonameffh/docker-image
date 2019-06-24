#!/usr/bin/env bash

docker build --no-cache -t nonameffh/node:lts lts
docker build --no-cache -t nonameffh/node:current current

docker push nonameffh/node:lts
docker push nonameffh/node:current