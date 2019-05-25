FROM symball/php:7-cli
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk --update add \
  # EXTRA DEVELOPER TOOLS
  php7-fileinfo \
  php7-pear \
  php7-simplexml \
  php7-tokenizer \
  php7-xdebug \
  php7-xsl \
  nodejs \
  nodejs-npm \
  shadow \
  && rm -rf /var/cache/apk/*

# Enable xDebug
RUN echo "zend_extension=xdebug.so" > /etc/php7/conf.d/xdebug.ini

# Copy across some of the utilities
COPY tools/ /usr/bin
COPY setup_user.sh /usr/bin/setup_user

# GulpJS task runner
RUN npm i -g \
    gulp \
    gulp-cli \
    grunt-cli \
    marked \
    node-gyp \
    webpack \
    yarn
CMD ["/bin/bash"]
