# @via https://github.com/docker-library/php/blob/23ac7b5e0d0e4ce78fef2f1e4b46d1c633ce77bd/7.2/stretch/fpm/Dockerfile
FROM php:7.2.28-fpm-stretch

ENV PHALCON_VERSION=4.0.4
ENV PHALCON_DEPS autoconf g++ make git 
ENV PHP_EXT_DEPS libmagickwand-dev

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ${PHALCON_DEPS} ${PHP_EXT_DEPS}; \
    rm -rf /var/lib/apt/lists/*; \
    pecl update-channels; \
    pecl install psr; \
    docker-php-ext-enable psr; \
    pecl install phalcon-${PHALCON_VERSION}; \
    docker-php-ext-enable phalcon; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-enable pdo_mysql; \
    pecl install redis; \
    docker-php-ext-enable redis; \
    pecl install imagick; \
    docker-php-ext-enable imagick; \
    pecl install swoole; \
    docker-php-ext-enable swoole; \
    apt-get purge -y --auto-remove ${PHALCON_DEPS}; \
    rm -rf /tmp/* ~/.pearrc

# {{{ test-start
# ~ RUN set -eux; \
# ~     apt-get update; \
# ~     apt-get install -y --no-install-recommends ${PHALCON_DEPS} ${PHP_EXT_DEPS}; \
# ~     rm -rf /var/lib/apt/lists/*; \
# ~     pecl update-channels
# ~ RUN set -eux; \
# ~     pecl install psr; \
# ~     docker-php-ext-enable psr
# ~ RUN set -eux; \
# ~     pecl install phalcon-4.0.4; \
# ~     docker-php-ext-enable phalcon
# ~ RUN set -eux; \
# ~     docker-php-ext-install pdo_mysql; \
# ~     docker-php-ext-enable pdo_mysql
# ~ RUN set -eux; \
# ~     pecl install redis; \
# ~     docker-php-ext-enable redis
# ~ RUN set -eux; \
# ~     pecl install imagick; \
# ~     docker-php-ext-enable imagick
# ~ RUN set -eux; \
# ~     pecl install swoole; \
# ~     docker-php-ext-enable swoole
# ~ RUN set -eux; \
# ~     apt-get purge -y --auto-remove ${PHALCON_DEPS}; \
# ~     rm -rf /tmp/* ~/.pearrc
# }}} test-end

EXPOSE 9000
CMD ["php-fpm"]