#!/bin/bash

wget -O pdepend http://static.pdepend.org/php/latest/pdepend.phar
wget -O phpcbf https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
wget -O phpcpd https://phar.phpunit.de/phpcpd.phar
wget -O phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
wget -O phpdox http://phpdox.de/releases/phpdox.phar
wget -O phploc https://phar.phpunit.de/phploc.phar
wget -O phpmd http://static.phpmd.org/php/latest/phpmd.phar
wget -O phpunit https://phar.phpunit.de/phpunit-7.phar

chmod +x ./*
