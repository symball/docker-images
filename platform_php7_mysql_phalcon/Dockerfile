FROM symball/docker-images:environment_php7_mysql
MAINTAINER Simon Ball <open-source@simonball.me>

USER root

# Copy phalcon from builder base
COPY --from=symball/docker-images:base_php7_developer_phalcon_builder /usr/lib/php7/modules/phalcon.so /usr/lib/php7/modules/phalcon.so

COPY pool_config.conf /etc/php7/php-fpm.d/www.conf

RUN apk --update add \
  php7-fpm \
  && rm -rf /var/cache/apk/*

CMD ["php-fpm7", "-F"]