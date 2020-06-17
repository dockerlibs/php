# @via https://github.com/docker-library/php/blob/057b438e69093c927a84cce4308c7ad08ccdd5b0/7.2/stretch/fpm/Dockerfile
FROM php:7.2.31-fpm-stretch

# @PHP-extensions:
# - imagick
# - pdo_mysql
# - psr
# - phalcon
# - redis
# - swoole

ENV PHP_EXT__DEPS autoconf g++ make
ENV PHP_EXT_PHALCON_DEPS libmagickwand-dev

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ${PHP_EXT__DEPS} ${PHP_EXT_PHALCON_DEPS}; \
    rm -rf /var/lib/apt/lists/*; \
    pecl update-channels; \
    pecl install imagick-3.4.4; \
    pecl install psr-1.0.0; \
    pecl install phalcon-4.0.6; \
    pecl install redis-5.2.2; \
    pecl install swoole-4.5.2; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-enable imagick psr phalcon redis swoole; \
    docker-php-source delete; \
    apt-get purge -y --auto-remove ${PHP_EXT__DEPS}; \
    rm -rf /tmp/* ~/.pearrc

EXPOSE 9000
CMD ["php-fpm"]