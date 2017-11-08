FROM symball/docker-images:base_php55
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apt-get update
RUN apt-get -y install \
  php5-fpm

CMD ["php5-fpm", "-F"]
