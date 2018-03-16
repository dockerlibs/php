FROM php:5.6.34-fpm-alpine
MAINTAINER Jerome Wang

ENV _PHPIZE_DEPS \
  autoconf \
  dpkg-dev \
  dpkg \
  file \
  g++ \
  gcc \
  libc-dev \
  make \
  pcre-dev \
  pkgconf \
  re2c

ENV _PHP_EXTRA_DEPS \
  bash \
  git

ENV _PHP_PERSISTENT_DEPS \
  cyrus-sasl-dev \
  libmcrypt-dev \
  libmemcached-dev \
  libpng-dev \
  zlib-dev

RUN set -xe \
  && apk add --no-cache --virtual .build-deps \
    $_PHPIZE_DEPS \
    $_PHP_EXTRA_DEPS \
  # :~
  && apk add --no-cache --virtual .persistent-deps \
    $_PHP_PERSISTENT_DEPS \
  # :~
  && pecl update-channels \
  && pecl install memcached-2.2.0 \
  && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini \
  # :~
  && git clone https://github.com/phalcon/cphalcon /tmp/cphalcon \
  && cd /tmp/cphalcon \
  && git checkout $_PHP_EXT_PHALCON_VERSION \
  && cd /tmp/cphalcon/build \
  && ./install 64bits \
  && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini \
  # :~
  && docker-php-ext-install \
    gd \
    iconv \
    mbstring \
    mcrypt \
    mysql \
    pdo_mysql \
    zip \
  # :~
  && apk del .build-deps \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/*

EXPOSE 9000

CMD ["php-fpm"]