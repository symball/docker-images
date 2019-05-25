# Symball Docker Images

For both production and development use, this repository is a collection of
Docker build files based on Alpine Linux for supporting a combination of PHP
environments.

For an example of how these images can be used in a project to serve a variety
of needs, please see the [Docker Quick Stack](https://github.com/symball/docker-quick-stack)
project. They can otherwise be found up on Docker hub as public images using
tags [from this Docker Hub](https://cloud.docker.com/u/symball/repository/docker/symball/docker-images)

## PHP 7 CLI
Used as the foundation for all other images, this container is currently based
on [Alpine Linux](https://alpinelinux.org/) 3.9. [Prestissimo](https://github.com/hirak/prestissimo) (parallel downloading) and [Phing](https://www.phing.info/) (MAKE like)
have been included globally via composer but, the following system packages are
included

```
php7
php7-apcu
php7-bcmath
php7-dom
php7-ctype
php7-curl
php7-fileinfo
php7-gd
php7-gettext
php7-iconv
php7-intl
php7-json
php7-ldap
php7-mbstring
php7-mcrypt
php7-opcache
php7-openssl
php7-pdo
php7-phar
php7-posix
php7-simplexml
php7-session
php7-soap
php7-tokenizer
php7-xml
php7-xmlreader
php7-xmlwriter
php7-zip
php7-zlib
autoconf
bash
ca-certificates
composer
curl
git
libsasl
openssh
```

## PHP 7 DEV

Based on the aforementioned image, this image adds a set of tools such as static
code analysis and task runners so that a developers machine can be kept clean of
such. **xDebug** is enabled by default in images including and based on this.

This image is only really intended to be used on devices where the full environment
will be local. When building images based off this, it is expected that the
developer will match the UID/GID across all services to allow simple management.

* [PHPCBF](https://phpqa.io/projects/phpcbf.html) - Code Beautifier
* [PHPCPD](https://phar.phpunit.de/) - Code Duplication detection
* [PHPCS](https://squizlabs.github.io/PHP_CodeSniffer/analysis/) - Code Sniffer
* [PHPDOX](http://phpdox.de/) - Document Generation
* [PHPLOC](https://github.com/sebastianbergmann/phploc) - Lines of code measurement
* [PHPUnit](https://phpunit.de/) - Unit Testing
* [Webpack](https://webpack.js.org/) - Node Bundler
* [yarn](https://yarnpkg.com/en/) - Alternative to npm
* [gruntjs](https://gruntjs.com/) - JavaScript Task Runner
* [Gulp](https://gulpjs.com/) - JavaScript Task Runner

Extra System Packages include:

```
php7-fileinfo \
php7-pear \
php7-simplexml \
php7-tokenizer \
php7-xdebug \
php7-xsl \
nodejs \
nodejs-npm \
shadow
```
