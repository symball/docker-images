FROM alpine:3.6
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk --update add \
  php7 \
  php7-apcu \
  php7-bcmath \
  php7-dom \
  php7-ctype \
  php7-curl \
  php7-fileinfo \
  php7-gd \
  php7-gettext \
  php7-iconv \
  php7-intl \
  php7-json \
  php7-ldap \
  php7-mbstring \
  php7-mcrypt \
  php7-opcache \
  php7-openssl \
  php7-pdo \
  php7-phar \
  php7-posix \
  php7-simplexml \
  php7-session \
  php7-soap \
  php7-tokenizer \
  php7-xml \
  php7-xmlreader \
  php7-xmlwriter \
  php7-zip \
  php7-zlib \
  autoconf \
  bash \
  ca-certificates \
  curl \
  git \
  libsasl \
  openssh \
  && ssh-keygen -A

# Build the Mongo extension
RUN apk add \
  build-base \
  gcc \
  abuild \
  binutils \
  openssl-dev \
  php7-dev \
  php7-pear

RUN pecl install mongodb

RUN echo "extension=mongodb.so" > /etc/php7/00_mongo.ini && chmod 755 /usr/lib/php7/modules/mongodb.so && chmod a+x /usr/lib/php7/modules/mongodb.so

COPY tools/phing /usr/local/bin/phing
COPY php.ini /etc/php7/php.ini

# Grab the latest Composer install
RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer && \
  composer --version
# Install composer plugin for parallel downloads
RUN composer global require hirak/prestissimo
WORKDIR /srv

CMD ["/bin/bash"]
