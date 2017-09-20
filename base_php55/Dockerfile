FROM ubuntu:14.04
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apt-get update
RUN apt-get -y install \
  php5 \
  php5-curl \
  php5-mysql \
  php5-gd \
  php5-mcrypt \
  php5-ldap \
  php5-xsl \
  curl \
  git \
  openssh-client

  # Grab the latest Composer install
  RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin \
    --filename=composer && \
    composer --version
    # Install composer plugin for parallel downloads
    RUN composer global require hirak/prestissimo


  # Copy across some of the utilities
  COPY tools/phing /usr/local/bin/phing

  # Output the versions os the above utilities
  RUN chmod a+x -R /usr/local/bin && \
   phing -v

# Prepare a user and workspace
RUN mkdir -p /srv

WORKDIR /srv

CMD ["/bin/bash"]
