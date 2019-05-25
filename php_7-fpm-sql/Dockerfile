FROM symball/php:7-cli-sql
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

COPY pool.conf /etc/php7/php-fpm.d/www.conf

RUN apk --update add \
  php7-fpm \
  && rm -rf /var/cache/apk/*

CMD ["php-fpm7", "-F"]
