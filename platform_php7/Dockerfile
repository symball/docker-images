FROM symball/pivot88:base_php7
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk --update add \
  php7-fpm \
  && rm -rf /var/cache/apk/* \

CMD ["php-fpm7", "-F"]