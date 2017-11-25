FROM symball/docker-images:environment_php7_mongo
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

COPY pool_config.conf /etc/php7/php-fpm.d/www.conf

RUN apk --update add \
  php7-fpm \
  && rm -rf /var/cache/apk/*

CMD ["php-fpm7", "-F"]