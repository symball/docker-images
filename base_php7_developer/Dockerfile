FROM symball/pivot88-docker:base_php7
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk --update add \
  # EXTRA DEVELOPER TOOLS
  php7-xdebug \
  php7-xsl \
  && rm -rf /var/cache/apk/* \

# Enable xDebug
RUN echo "zend_extension=xdebug.so" > /etc/php7/conf.d/xdebug.ini

# Copy across some of the utilities
COPY tools/pdepend /usr/local/bin/pdepend
COPY tools/phpcpd /usr/local/bin/phpcpd
COPY tools/phpdox /usr/local/bin/phpdox
COPY tools/phploc /usr/local/bin/phploc
COPY tools/phpmd /usr/local/bin/phpmd
COPY tools/phpunit /usr/local/bin/phpunit

# Output the versions os the above utilities
RUN chmod a+x -R /usr/local/bin && \
 phpcpd --version && \
 phpdox --version && \
 phploc --version && \
 phpmd --version && \
 phpunit --version

CMD ["/bin/bash"]