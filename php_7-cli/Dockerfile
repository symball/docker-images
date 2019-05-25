FROM alpine:3.9
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
  composer \
  curl \
  git \
  libsasl \
  openssh \
  && ssh-keygen -A \
  && rm -rf /var/cache/apk/* \
  && find / -type f -iname \*.apk-new -delete

# Copy any extra tools that are to be include in the image
COPY tools/ /usr/bin
RUN chmod a+x /usr/bin/*

COPY php.ini /etc/php7/php.ini

# Add timezone
RUN ln -s /usr/share/zoneinfo/UTC /etc/localtime && "date" && \
    composer global require hirak/prestissimo && \
    composer global require phing/phing

WORKDIR /srv
CMD ["/bin/bash"]
