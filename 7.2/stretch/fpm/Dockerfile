# @VIA https://github.com/docker-library/php/blob/9bcb75e9dbd3a0ebafe3f825297724df30e3b254/7.2/stretch/fpm/Dockerfile
FROM php:7.2.25-fpm-stretch

# @PHP-extensions:
# - imagick
# - pdo_mysql
# - phalcon
# - redis
# - swoole

ENV BUILD_DEPS autoconf g++ make git
ENV RUNTIME_DEPS libmagickwand-dev

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ${BUILD_DEPS} ${RUNTIME_DEPS}; \
    rm -rf /var/lib/apt/lists/*; \
    git clone -b v3.4.5 https://github.com/phalcon/cphalcon.git /usr/src/php/ext/phalcon; \
    cd /usr/src/php/ext/phalcon/build; \
    bash install --arch 64bits; \
    rm -rf /usr/src/php/ext/phalcon; \
    pecl update-channels; \
    pecl install imagick-3.4.4; \
    pecl install redis-5.2.2; \
    pecl install swoole-4.5.2; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-enable imagick phalcon redis swoole; \
    docker-php-source delete; \
    apt-get purge -y --auto-remove ${BUILD_DEPS}; \
    rm -rf /tmp/* ~/.pearrc
