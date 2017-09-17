FROM symball/pivot88-docker:base_php7
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

COPY pool_config.conf /etc/php7/php-fpm.d/www.conf
COPY php.ini /etc/php7/php.ini

RUN apk --update add \
  php7-fpm \
  && rm -rf /var/cache/apk/*

CMD ["php-fpm7", "-F"]