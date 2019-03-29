FROM php:5.6.40-fpm-jessie
MAINTAINER Jerome Wang

# apt install dependencies for php extensions
RUN apt-get update \
  && apt-get install -y \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmagickwand-dev \
      libmcrypt-dev \
      libmemcached-dev \
      libpng12-dev \
      git

# install php extensions
RUN docker-php-ext-configure gd \
      --enable-gd-native-ttf \
      --with-freetype-dir=/usr/include/freetype2 \
      --with-jpeg-dir=/usr/include \
      --with-png-dir=/usr/include \
  && docker-php-ext-install \
      gd \
      iconv \
      mbstring \
      mcrypt \
      mysql \
      pdo_mysql \
      zip \
  && pecl install memcached-2.2.0 \
  && docker-php-ext-enable memcached \
  && pecl install imagick \
  && docker-php-ext-enable imagick \
  && pecl install redis \
  && docker-php-ext-enable redis

# install extension for phalcon
RUN git clone https://github.com/phalcon/cphalcon /tmp/cphalcon \
  && cd /tmp/cphalcon \
  && git checkout v3.4.3 \
  && cd /tmp/cphalcon/build \
  && ./install --arch 64bits \
  && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini

# clean
RUN apt-get remove git -y \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -r /var/lib/apt/lists/* \
  && rm -rf /tmp/*

EXPOSE 9000

CMD ["php-fpm"]