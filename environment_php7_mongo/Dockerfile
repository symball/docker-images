FROM symball/docker-images:base_php7
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk add --update \
  --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
  php7-mongodb

WORKDIR /srv

CMD ["/bin/bash"]
