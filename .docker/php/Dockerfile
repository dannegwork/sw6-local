FROM php:8.1.9-fpm
MAINTAINER Dana Negrescu <dana.negrescu@boxalino.com>

ENV COMPOSER_HOME=/.composer
ENV NPM_CONFIG_CACHE=/.npm
ENV WEB_DOCUMENT_ROOT=/var/www/shopware/public

# install libs according to Magento2 documentation&requirements
RUN apt-get update && apt-get install -y \
    cron \
    libmemcached-dev \
    libssl-dev \
    libz-dev \
    libmemcached11 \
    libmcrypt-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libpq-dev \
    zlib1g-dev \
    libicu-dev \
    libssl-dev \
    libmcrypt-dev \
    libxml2-dev \
    curl \
    ssh \
    libssh2-1-dev \
    nano \
    htop \
    git \
    openssl \
    libonig-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    pkg-config \
    zlib1g-dev \
    libjudy-dev \
    g++

# Install and configure libraries and extensions
RUN docker-php-ext-install pdo_mysql \
  && docker-php-ext-install pdo_pgsql \
  && docker-php-ext-configure intl \
  && docker-php-ext-configure hash --with-mhash

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --enable-gd

# Install required extensions
RUN docker-php-ext-install \
   curl \
   dom \
   fileinfo \
   gd \
   iconv \
   json \
   libxml \
   mbstring \
   openssl \
   pcre \
   pdo \
   phar \
   simplexml \
   sodium \
   xml \
   zip \
   zlib

#Installing SSH2
RUN pecl channel-update pecl.php.net
RUN apt-get install -y git libssh2-1 libssh2-1-dev && \
  pecl install ssh2-1.3.1 && \
  docker-php-ext-enable ssh2

RUN curl -O https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz \
    && tar xfvz libsodium-1.0.18.tar.gz \
    && cd libsodium-1.0.18 \
    && ./configure \
    && make && make install \
    && pecl install -f libsodium

RUN mkdir -p ${NPM_CONFIG_CACHE} \
    && apt-install default-mysql-client nodejs google-chrome-stable libicu-dev graphviz vim gnupg2 libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb \
    \
    && npm install -g npm@^6.14.11 \
    && npm i forever -g \
    && chown -R www-data:www-data ${NPM_CONFIG_CACHE} \
    \
    && pecl install pcov \
    && docker-php-ext-enable pcov

COPY ./conf/php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./conf/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
ADD ./bin/* /usr/local/bin/

# Get composer installed to /usr/local/bin/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install xdebug
RUN pecl install xdebug

WORKDIR "/var/www/shopware"
VOLUME "/usr/local/etc/php/conf.d"

RUN usermod -u 1000 www-data
RUN usermod -G 100 www-data
EXPOSE 9000

CMD ["php-fpm"]
