FROM symball/php:7-cli-dev
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk --update add \
  php7-pgsql \
  php7-pdo_pgsql \
  php7-pdo_sqlite \
  && rm -rf /var/cache/apk/*

WORKDIR /srv
CMD ["/bin/bash"]
