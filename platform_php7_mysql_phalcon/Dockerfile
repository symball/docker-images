# Start off compiling phalcon using the same image
FROM symball/docker-images:platform_php7_mysql as phalcon_builder
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

FROM symball/docker-images:environment_php7_mysql
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

# Copy across the phalcon module built in the last image
COPY --from=phalcon_builder /usr/lib/php7/modules/phalcon.so /usr/lib/php7/modules/phalcon.so

COPY pool_config.conf /etc/php7/php-fpm.d/www.conf

RUN apk --update add \
  php7-fpm \
  && rm -rf /var/cache/apk/*

CMD ["php-fpm7", "-F"]