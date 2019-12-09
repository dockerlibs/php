# via https://github.com/docker-library/php/blob/250c2d872d4d52770ecdcecd0ff299c360031ed8/7.1/alpine3.10/fpm/Dockerfile
FROM php:7.1.30-fpm-alpine3.10

ENV EXT_DEPS icu-dev autoconf g++ make
# php.extension = redis
# ~ ENV PHPREDIS_VERSION 4.3.0
# ~ ENV PHPREDIS_URL="https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz"
# php.extension = phalcon
ENV PHALCON_VERSION=3.4.3
ENV PHALCON_DEPS autoconf g++ make git
# php.extension = memcached
ENV MEMCACHED_VERSION=3.1.3
ENV MEMCACHED_DEPS libmemcached-dev zlib-dev cyrus-sasl-dev git

# php.extension = pdo_mysql, redis
RUN set -eux; \
        apk add --update icu; \
        apk add --no-cache --virtual .ext-deps ${EXT_DEPS}; \
        pecl install redis; \
        docker-php-ext-install pdo_mysql; \
        apk del .ext-deps

# ~ # php.extension = redis
# ~ RUN docker-php-source extract \
# ~     && curl -L -o /tmp/redis.tar.gz ${PHPREDIS_URL} \
# ~     && tar xfz /tmp/redis.tar.gz \
# ~     && rm -r /tmp/redis.tar.gz \
# ~     && mv phpredis-${PHPREDIS_VERSION} /usr/src/php/ext/redis \
# ~     && docker-php-ext-install redis \
# ~     && docker-php-source delete

# php.extension = phalcon
RUN set -eux; \
        apk add --no-cache --virtual .phalcon-deps ${PHALCON_DEPS}; \
        git clone -b v${PHALCON_VERSION} https://github.com/phalcon/cphalcon.git /usr/src/php/ext/phalcon; \
        cd /usr/src/php/ext/phalcon/build; \
        sh install --arch 64bits; \
        docker-php-ext-enable phalcon; \
        rm -rf /usr/src/php/ext/phalcon; \
        apk del .phalcon-deps

# php.extension = memcached
RUN set -eux; \
        apk add --update libmemcached; \
        apk add --no-cache --virtual .memcached-deps ${MEMCACHED_DEPS}; \
        git clone -b php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached; \
        docker-php-ext-configure /usr/src/php/ext/memcached --disable-memcached-sasl; \
        docker-php-ext-install /usr/src/php/ext/memcached; \
        apk del .memcached-deps; \
        rm -rf /usr/src/php/ext/memcached; \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9000
CMD ["php-fpm"]