FROM symball/php:7-cli-postgresql
MAINTAINER Simon Ball <open-source@simonball.me>

RUN apk --update add \
  php7-fpm \
  && rm -rf /var/cache/apk/*

COPY pool.conf /etc/php7/php-fpm.d/www.conf

CMD ["php-fpm7", "-F"]
