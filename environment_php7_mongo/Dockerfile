FROM symball/docker-images:base_php7
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk add --update \
  php7-mongodb

WORKDIR /srv

CMD ["/bin/bash"]
