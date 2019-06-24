FROM nonameffh/php:7.3

LABEL maintainer="Aleksey Tarasov <nonameffh@gmail.com>"

## add packages
RUN pecl install xdebug \
    && php-enable-extension xdebug.so 