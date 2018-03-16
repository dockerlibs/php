FROM php:5.6.34-fpm
MAINTAINER Jerome Wang

ENV _PHP_EXT_PHALCON_VERSION v3.3.2

# apt install dependencies for php extensions
RUN apt-get update \
  && apt-get install -y \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libmemcached-dev \
      libpng12-dev \
      git

# install php extensions
RUN docker-php-ext-install \
      gd \
      iconv \
      mbstring \
      mcrypt \
      mysql \
      pdo_mysql \
      zip \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && pecl install memcached-2.2.0 \
  && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini

# install extension for phalcon
RUN git clone https://github.com/phalcon/cphalcon /tmp/cphalcon \
  && cd /tmp/cphalcon \
  && git checkout $_PHP_EXT_PHALCON_VERSION \
  && cd /tmp/cphalcon/build \
  && ./install 64bits \
  && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini

# clean
RUN apt-get remove git -y \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -r /var/lib/apt/lists/* \
  && rm -rf /tmp/*

EXPOSE 9000

CMD ["php-fpm"]