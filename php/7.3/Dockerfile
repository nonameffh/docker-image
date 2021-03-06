FROM nonameffh/alpine:3.9

LABEL maintainer="Aleksey Tarasov <nonameffh@gmail.com>"

## install dependencies
RUN apk add --no-cache --virtual .php-deps \
    git \
    icu icu-dev \
    libzip libzip-dev \
    libressl libressl-dev \
    libsodium-dev \
    libjpeg libpng libgd freetype-dev \
    libedit-dev libxml2-dev openssl zlib-dev \
    tzdata \
    sqlite-dev postgresql-dev \
    curl-dev \
    rabbitmq-c rabbitmq-c-dev \
    libmemcached libmemcached-dev \
    c-client imap-dev \
    imagemagick imagemagick-dev imagemagick-libs 

COPY bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint && \
    chmod +x /usr/local/bin/phpctl*

ENV PHP_VERSION="7.3.16"
ENV PHP_USER_ID="2000"
ENV PHP_USER_NAME="app" 
ENV PHP_GPG_KEYS="CBAF69F173A0FEA4B537F470D66C9593118BCCB6 F38252826ACD957EF380D39F2F7956BC5DA04B5D" 
ENV PHP_URL="https://secure.php.net/get/php-${PHP_VERSION}.tar.xz/from/this/mirror" 
ENV PHP_ASC_URL="https://secure.php.net/get/php-${PHP_VERSION}.tar.xz.asc/from/this/mirror" 
ENV PHP_SHA256="" 
ENV PHP_MD5="" 
ENV PHP_INI_DIR="/etc/php"
ENV PHP_INSTALL_ARGUMENTS="--enable-fpm --with-fpm-user=${PHP_USER_NAME} --with-fpm-group=${PHP_USER_NAME}"
ENV PHP_EXTRA_INSTALL_ARGUMENTS="\
    --enable-bcmath \
    --enable-ftp \
    --enable-mbstring \
    --enable-mysqlnd \
    --enable-opcache \
    --enable-sockets \
    --enable-pcntl \
    --enable-intl \
    --enable-calendar \
    --enable-shared \
    --enable-zip \
    --with-pgsql \
    --with-mysqli \
    --with-gd \
    --with-readline \
    --with-curl \
    --with-libedit \
    --with-openssl \
    --with-zlib \
    --with-pdo-mysql \
    --with-pdo-pgsql \
    --with-mhash \
    --with-sodium=shared \
    --with-imap --with-imap-ssl \
    " 
ENV PHP_CFLAGS="-fstack-protector-strong -fpic -fpie -O2" 
ENV PHP_CPPFLAGS="$PHP_CFLAGS" 
ENV PHP_LDFLAGS="-Wl,-O1 -Wl,--hash-style=both -pie"
## disable multi-threading for ImageMagick
ENV MAGICK_THREAD_LIMIT="1" 

RUN set -x && \
    ## add user and group, create work dir
    addgroup -g ${PHP_USER_ID} -S ${PHP_USER_NAME} && \
    adduser -u ${PHP_USER_ID} -D -S -G ${PHP_USER_NAME} ${PHP_USER_NAME} && \
    mkdir -p /var/www/html && chown -R ${PHP_USER_NAME}:${PHP_USER_NAME} /var/www/html; \
    ## create php directories
    mkdir -p ${PHP_INI_DIR}/conf.d && mkdir -p ${PHP_INI_DIR}/php-fpm && mkdir -p /var/log/php-fpm; \
    ## install PHP
    phpctl.install && phpctl.get-composer \
    && pecl config-set php_ini $PHP_INI_DIR/php.ini \
    && pecl install amqp memcached redis imagick \
    && phpctl.enable-extension amqp.so memcached.so opcache.so redis.so imagick.so \
    && echo "PHP and composer installed"

COPY conf/* /usr/src/fpm-conf/
RUN rm -f $PHP_INI_DIR/php-fpm.conf \
    && rm -rf $PHP_INI_DIR/php-fpm/* \
    && mv /usr/src/fpm-conf/php-fpm.conf $PHP_INI_DIR/php-fpm.conf \
    && mv /usr/src/fpm-conf/*.conf $PHP_INI_DIR/php-fpm/ \
    && sed -i "s|##PHP_INI_DIR##|${PHP_INI_DIR}|g" $PHP_INI_DIR/php-fpm.conf \
    && sed -i "s|##PHP_USER_NAME##|${PHP_USER_NAME}|g" $PHP_INI_DIR/php-fpm/*.conf \
    && rm -rf /usr/src/fpm-conf

WORKDIR /var/www/html

EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["phpctl.start-fpm"]
