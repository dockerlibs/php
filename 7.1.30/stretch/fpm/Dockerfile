# via https://github.com/docker-library/php/blob/250c2d872d4d52770ecdcecd0ff299c360031ed8/7.1/stretch/fpm/Dockerfile
FROM php:7.1.30-fpm-stretch

ENV PHALCON_VERSION=3.4.3
ENV PHALCON_DEPS autoconf g++ make git

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ${PHALCON_DEPS}; \
    rm -rf /var/lib/apt/lists/*; \
    git clone -b v${PHALCON_VERSION} https://github.com/phalcon/cphalcon.git /usr/src/php/ext/phalcon; \
    cd /usr/src/php/ext/phalcon/build; \
    bash install --arch 64bits; \
    docker-php-ext-enable phalcon; \
    rm -rf /usr/src/php/ext/phalcon; \
    apt-get purge --auto-remove ${PHALCON_DEPS}; \
    \
    pecl update-channels; \
    pecl install swoole; \
    docker-php-ext-enable swoole; \
    rm -rf /tmp/* ~/.pearrc

EXPOSE 9000
CMD ["php-fpm"]