# @via https://github.com/docker-library/php/blob/master/7.4/alpine3.12/fpm/Dockerfile
FROM php:7.4.7-fpm-alpine3.12

# @PHP-extensions:
# - imagick
# - pdo_mysql
# - phalcon
# - psr
# - redis
# - swoole

ENV PHP_EXT_BUILD_DEPS autoconf g++ make
ENV PHP_EXT__DEPS imagemagick

RUN set -eux; \
    apk add --no-cache --virtual .build-deps \
        ${PHP_EXT_BUILD_DEPS} \
    ; \
    apk add --no-cache ${PHP_EXT__DEPS}; \
    pecl update-channels; \
    pecl install imagick-3.4.4; \
    pecl install psr-1.0.0;     \
    pecl install phalcon-4.0.6; \
    pecl install redis-5.2.2;   \
    pecl install swoole-4.5.2;  \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-enable imagick psr phalcon redis swoole; \
    docker-php-source delete; \
    apk del --no-network .build-deps; \
    rm -rf /tmp/pear ~/.pearrc

# {{{test-start
# RUN set -eux; \
#     apk add --no-cache --virtual .build-deps \
#     ${PHP_EXT_BUILD_DEPS} \
#     ; \
#     apk add --no-cache ${PHP_EXT__DEPS}; \
#     pecl update-channels
# RUN set -eux; pecl install imagick-3.4.4
# RUN set -eux; pecl install psr-1.0.0
# RUN set -eux; pecl install phalcon-4.0.6
# RUN set -eux; pecl install redis-5.2.2
# RUN set -eux; pecl install swoole-4.5.2
# RUN set -eux; docker-php-ext-install pdo_mysql
# RUN set -eux; docker-php-ext-enable imagick psr phalcon redis swoole
# RUN set -eux; \
#     apk del --no-network .build-deps; \
#     rm -rf /tmp/pear ~/.pearrc
# test-end}}}

STOPSIGNAL SIGQUIT

EXPOSE 9000
CMD ["php-fpm"]