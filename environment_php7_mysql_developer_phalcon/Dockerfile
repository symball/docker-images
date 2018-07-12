FROM symball/docker-images:base_php7_developer
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

RUN apk --update add \
  php7-mysqlnd \
  php7-pdo_mysql \
  php7-pdo_sqlite

# Copy phalcon from builder base
COPY --from=symball/docker-images:base_php7_developer_phalcon_builder /usr/lib/php7/modules/phalcon.so /usr/lib/php7/modules/phalcon.so

# Enable Phalcon extension
RUN echo "extension=phalcon.so" > /etc/php7.conf.d/phalcon.ini

WORKDIR /var/opt
RUN git clone git://github.com/phalcon/phalcon-devtools.git
RUN ln -s /var/opt/phalcon-devtools/phalcon.php /usr/local/bin/phalcon && chmod ugo+x /usr/local/bin/phalcon

WORKDIR /srv
CMD ["/bin/bash"]