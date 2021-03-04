# @via https://github.com/docker-library/php/blob/master/7.2/buster/fpm/Dockerfile
FROM php:7.2.33-fpm-buster

# @PHP-extensions:
# - igbinary
# - imagick
# - lzf
# - memcached
# - msgpack
# - pdo_mysql
# - phalcon
# - psr
# - redis
# - swoole

ENV BUILD_DEPS autoconf g++ make git
ENV BUILD_DEPS_REMOVED g++ make git
ENV RUNTIME_DEPS \
                 libmagickwand-dev \
                 libmemcached-dev \
                 zlib1g-dev

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ${BUILD_DEPS} ${RUNTIME_DEPS}; \
    rm -rf /var/lib/apt/lists/*; \
# install extension for igbinary v3.2.1
    pecl install igbinary-3.2.1;  \
# install extension for imagick v3.4.4
    pecl install imagick-3.4.4; \
# install extension for lzf v1.6.8
    pecl install lzf-1.6.8; \
# install extension for memcached v3.1.5
    pecl install memcached-3.1.5; \
# install extension for msgpack v2.1.2
    pecl install msgpack-2.1.2; \
# install phalcon v3.4.5
    git clone -b v3.4.5 https://github.com/phalcon/cphalcon.git /usr/src/php/ext/phalcon; \
    cd /usr/src/php/ext/phalcon/build; \
    bash install --arch 64bits; \
    rm -rf /usr/src/php/ext/phalcon; \
    pecl update-channels;       \
# install extension for psr v1.0.1
    pecl install psr-1.0.1;     \
# install extension for redis v5.3.3
    pecl install redis-5.3.3;   \
# install extension for swoole v4.6.3
    pecl install swoole-4.6.3;  \
# install extension for bcmath
    docker-php-ext-install bcmath; \
# install extension for pdo_mysql
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-enable bcmath igbinary imagick lzf memcached msgpack phalcon psr redis swoole; \
    echo "extension=bcmath.so" > $PHP_INI_DIR/conf.d/docker-php-ext-bcmath.ini \
    docker-php-source delete; \
    apt-get purge -y --auto-remove ${BUILD_DEPS_REMOVED}; \
    rm -rf /tmp/* ~/.pearrc
