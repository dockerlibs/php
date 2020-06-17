# @via https://github.com/docker-library/php/blob/master/7.4/buster/fpm/Dockerfile
FROM php:7.4.7-fpm-buster

# @PHP-extensions:
# - imagick
# - pdo_mysql
# - phalcon
# - psr
# - redis
# - swoole

ENV PHP_EXT_BUILD_DEPS autoconf g++ make
ENV PHP_EXT__DEPS libmagickwand-dev

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ${PHP_EXT_BUILD_DEPS} \
        ${PHP_EXT__DEPS} \
    ; \
    pecl update-channels; \
    pecl install imagick-3.4.4; \
    pecl install psr-1.0.0;     \
    pecl install phalcon-4.0.6; \
    pecl install redis-5.2.2;   \
    pecl install swoole-4.5.2;  \
    docker-php-ext-enable imagick psr phalcon redis swoole; \
    docker-php-source delete; \
    apt-get purge -y --auto-remove ${PHP_EXT_BUILD_DEPS}; \
    rm -rf /tmp/pear ~/.pearrc

# {{{test-start
# RUN set -eux; \
#     apt-get update; \
#     apt-get install -y --no-install-recommends \
#         ${PHP_EXT_BUILD_DEPS} \
#         ${PHP_EXT__DEPS} \
#     ; \
#     \
#     pecl update-channels
# RUN set -eux; pecl install imagick-3.4.4
# RUN set -eux; pecl install psr-1.0.0
# RUN set -eux; pecl install phalcon-4.0.6
# RUN set -eux; pecl install redis-5.2.2
# RUN set -eux; pecl install swoole-4.5.2
# RUN set -eux; docker-php-ext-enable imagick psr phalcon redis swoole
# RUN set -eux; \
#     apt-get purge -y --auto-remove ${PHP_EXT_BUILD_DEPS}; \
#     rm -rf /tmp/pear ~/.pearrc
# test-end}}}

STOPSIGNAL SIGQUIT

EXPOSE 9000
CMD ["php-fpm"]