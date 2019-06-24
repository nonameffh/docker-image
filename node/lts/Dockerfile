FROM node:lts-alpine

LABEL maintainer="Aleksey Tarasov <nonameffh@gmail.com>"

ENV INSTALLED_PACKAGES \
    file \
    nano \
    curl \
    wget \
    openssl \
    su-exec \
    bash \
    net-tools \
    coreutils \
    shadow


RUN apk add --no-cache --virtual .base_deps $INSTALLED_PACKAGES
RUN npm install --global webpack

CMD [ "node" ]