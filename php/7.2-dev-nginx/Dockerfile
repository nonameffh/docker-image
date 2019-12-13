FROM nonameffh/php:7.2-dev

LABEL maintainer="Aleksey Tarasov <nonameffh@gmail.com>"

RUN apk add  --no-cache --update \
    supervisor \
    nginx \
    && mkdir -p /var/run/nginx

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/run-app \
    && mkdir -p /var/tmp/nginx \
    && chmod -R 777 /var/tmp/nginx \
    && chown -R 2000:2000 /var/tmp/nginx

EXPOSE 80
CMD ["run-app"]