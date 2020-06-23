#!/bin/bash

echo ''
echo ''
echo '#################'
echo '### PHP 7 CLI ###'
echo '#################'
echo ''
cd php_7-cli \
  && docker build -t symball/php:7-cli . \
  && docker push symball/php:7-cli \
  && cd  ..

echo ''
echo ''
echo '#################'
echo '### PHP 7 DEV ###'
echo '#################'
echo ''
cd php_7-cli-dev \
  && docker build -t symball/php:7-cli-dev . \
  && docker push symball/php:7-cli-dev \
  && cd  ..

echo ''
echo ''
echo '#################'
echo '### PHP 7 SQL ###'
echo '#################'
echo ''
cd php_7-cli-sql \
  && docker build -t symball/php:7-cli-sql . \
  && docker push symball/php:7-cli-sql \
  && cd  ..

echo ''
echo ''
echo '#####################'
echo '### PHP 7 DEV/SQL ###'
echo '#####################'
echo ''
cd php_7-cli-dev-sql \
  && docker build -t symball/php:7-cli-dev-sql . \
  && docker push symball/php:7-cli-dev-sql \
  && cd  ..

echo ''
echo ''
echo '#####################'
echo '### PHP 7 FPM/SQL ###'
echo '#####################'
echo ''
cd php_7-fpm-sql \
  && docker build -t symball/php:7-fpm-sql . \
  && docker push symball/php:7-fpm-sql \
  && cd  ..

echo ''
echo ''
echo '#######################'
echo '### PHP 7 POSGRESQL ###'
echo '#######################'
echo ''
cd php_7-cli-postgresql \
  && docker build -t symball/php:7-cli-postgresql . \
  && docker push symball/php:7-cli-postgresql \
  && cd  ..

echo ''
echo ''
echo '############################'
echo '### PHP 7 DEV/POSTGRESQL ###'
echo '############################'
echo ''
cd php_7-cli-dev-postgresql \
  && docker build -t symball/php:7-cli-dev-postgresql . \
  && docker push symball/php:7-cli-dev-postgresql \
  && cd  ..

echo ''
echo ''
echo '############################'
echo '### PHP 7 FPM/POSTGRESQL ###'
echo '############################'
echo ''
cd php_7-fpm-postgresql \
  && docker build -t symball/php:7-fpm-postgresql . \
  && docker push symball/php:7-fpm-postgresql \
  && cd  ..