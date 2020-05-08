#!/usr/bin/env bash

docker build --no-cache -t nonameffh/php:7.1 7.1
docker build --no-cache -t nonameffh/php:7.1-dev 7.1-dev
docker build --no-cache -t nonameffh/php:7.1-nginx 7.1-nginx
docker build --no-cache -t nonameffh/php:7.1-dev-nginx 7.1-dev-nginx

docker build --no-cache -t nonameffh/php:7.2 7.2
docker build --no-cache -t nonameffh/php:7.2-dev 7.2-dev
docker build --no-cache -t nonameffh/php:7.2-nginx 7.2-nginx
docker build --no-cache -t nonameffh/php:7.2-dev-nginx 7.2-dev-nginx

docker build --no-cache -t nonameffh/php:7.3 7.3
docker build --no-cache -t nonameffh/php:7.3-dev 7.3-dev
docker build --no-cache -t nonameffh/php:7.3-nginx 7.3-nginx
docker build --no-cache -t nonameffh/php:7.3-dev-nginx 7.3-dev-nginx

docker build --no-cache -t nonameffh/php:7.4 7.4
docker build --no-cache -t nonameffh/php:7.4-dev 7.4-dev
docker build --no-cache -t nonameffh/php:7.4-nginx 7.4-nginx
docker build --no-cache -t nonameffh/php:7.4-dev-nginx 7.4-dev-nginx

docker push nonameffh/php:7.1
docker push nonameffh/php:7.1-dev
docker push nonameffh/php:7.1-nginx
docker push nonameffh/php:7.1-dev-nginx

docker push nonameffh/php:7.2
docker push nonameffh/php:7.2-dev
docker push nonameffh/php:7.2-nginx
docker push nonameffh/php:7.2-dev-nginx

docker push nonameffh/php:7.3
docker push nonameffh/php:7.3-dev
docker push nonameffh/php:7.3-nginx
docker push nonameffh/php:7.3-dev-nginx

docker push nonameffh/php:7.4
docker push nonameffh/php:7.4-dev
docker push nonameffh/php:7.4-nginx
docker push nonameffh/php:7.4-dev-nginx

