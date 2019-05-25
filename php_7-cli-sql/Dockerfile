FROM symball/php:7-base
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk --update add \
  php7-mysqlnd \
  php7-pdo_mysql \
  php7-pdo_sqlite \
  && rm -rf /var/cache/apk/* \
  && find / -type f -iname \*.apk-new -delete

WORKDIR /srv

CMD ["/bin/bash"]
