FROM php:7.2.11-fpm-stretch
MAINTAINER Jerome Wang

# apt install dependencies for php extensions
RUN apt-get update \
  && apt-get install -y \
      libmagickwand-dev \
      libmcrypt-dev \
      libmemcached-dev

# install php extensions
RUN pecl update-channels \
  && pecl install mcrypt \
  && pecl install memcached \
  && docker-php-ext-enable memcached \
  && pecl install imagick \
  && docker-php-ext-enable imagick

# install extension for phalcon
#RUN git clone https://github.com/phalcon/cphalcon /tmp/cphalcon \
#  && cd /tmp/cphalcon \
#  && git checkout v3.4.1 \
#  && cd /tmp/cphalcon/build \
#  && ./install --arch 64bits \
#  && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini

# clean
RUN apt-get autoremove -y \
  && apt-get clean \
  && rm -r /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /tmp/pear ~/.pearrc

EXPOSE 9000

CMD ["php-fpm"]