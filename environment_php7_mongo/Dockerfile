FROM symball/docker-images:base_php7
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN pecl install mongodb

RUN echo "extension=mongodb.so" > /etc/php7/conf.d/00_mongo.ini && chmod 755 /usr/lib/php7/modules/mongodb.so && chmod a+x /usr/lib/php7/modules/mongodb.so

WORKDIR /srv

CMD ["/bin/bash"]
