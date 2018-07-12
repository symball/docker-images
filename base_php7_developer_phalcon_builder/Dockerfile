FROM symball/docker-images:base_php7_developer
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk --update add \
    build-base \
    file \
    libtool \
    pcre-dev \
    php7-dev \
    re2c

WORKDIR /tmp
RUN git clone --depth=1 "git://github.com/phalcon/cphalcon.git"
WORKDIR /tmp/cphalcon/build
RUN ./install
# Installed to /usr/lib/php7/modules/phalcon.so
