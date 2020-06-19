# @via https://github.com/docker-library/php/blob/master/7.3/buster/fpm/Dockerfile
FROM php:7.3.19-fpm-buster

# @PHP-extensions:
# - imagick
# - pdo_mysql
# - psr
# - phalcon
# - redis
# - swoole

ENV BUILD_DEPS autoconf g++ make
ENV BUILD_DEPS_REMOVED g++ make
ENV RUNTIME_DEPS libmagickwand-dev

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ${BUILD_DEPS} ${RUNTIME_DEPS}; \
    rm -rf /var/lib/apt/lists/*; \
    pecl update-channels;       \
    pecl install imagick-3.4.4; \
    pecl install psr-1.0.0;     \
    pecl install phalcon-4.0.6; \
    pecl install redis-5.2.2;   \
    pecl install swoole-4.5.2;  \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-enable imagick psr phalcon redis swoole; \
    docker-php-source delete; \
    apt-get purge -y --auto-remove ${BUILD_DEPS_REMOVED}; \
    rm -rf /tmp/* ~/.pearrc
