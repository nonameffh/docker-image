FROM nonameffh/php:7.1-dev

LABEL maintainer="Aleksey Tarasov <nonameffh@gmail.com>"

RUN apk add  --no-cache --update \
    supervisor \
    nginx 

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY bin/* /usr/local/bin/
RUN mkdir -p /var/run/nginx && mkdir -p /var/tmp/nginx \
    && chmod +x /usr/local/bin/app.run \
    && chmod +x /usr/local/bin/nginx.fix-tmp-owner \
    && /usr/local/bin/nginx.fix-tmp-owner

EXPOSE 80
CMD ["app.run"]