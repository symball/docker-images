#!/bin/bash

wget -O phpcpd https://phar.phpunit.de/phpcpd.phar
wget -O phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
wget -O phpdox http://phpdox.de/releases/phpdox.phar
wget -O phploc https://phar.phpunit.de/phploc.phar
wget -O phpunit https://phar.phpunit.de/phpunit-7.phar

chmod +x ./*

echo '' > tool_versions.txt
./phpcpd --version  >> tool_versions.txt
./phpcs --version  >> tool_versions.txt
./phpdox --version  >> tool_versions.txt
./phploc --version  >> tool_versions.txt
./phpunit --version  >> tool_versions.txt
