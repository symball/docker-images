FROM symball/pivot88-docker:base_php55
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apt-get update
RUN apt-get -y install \
  node \
  nodejs \
  npm

  # Copy across some of the utilities
  COPY tools/phpdox /usr/local/bin/phpdox
  COPY tools/phploc /usr/local/bin/phploc
  COPY tools/phpmd /usr/local/bin/phpmd
  COPY tools/phpunit /usr/local/bin/phpunit

  # Output the versions os the above utilities
  RUN chmod a+x -R /usr/local/bin && \
   phpdox --version && \
   phploc --version && \
   phpmd --version && \
   phpunit --version

  # GulpJS task runner
  RUN npm i -g gulp bower
  # RUN gulp -v
  # TODO Check bower on this version
  # && bower -v

CMD ["/bin/bash"]
