FROM ubuntu:14.04
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apt-get update
RUN apt-get -y install \
  language-pack-ar \
  language-pack-en \
  language-pack-es \
  language-pack-fr \
  language-pack-ja \
  language-pack-km \
  language-pack-vi \
  language-pack-zh-hans-base \
  fonts-arphic-uming \
  php5 \
  php5-curl \
  php5-intl \
  php5-mysql \
  php5-gd \
  php5-mcrypt \
  php5-ldap \
  php5-xsl \
  curl \
  git \
  openssh-client

RUN php5enmod mcrypt && php5enmod intl

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
  RUN chmod a+x -R /usr/local/bin

# Prepare a user and workspace
RUN mkdir -p /srv

WORKDIR /srv

CMD ["/bin/bash"]
