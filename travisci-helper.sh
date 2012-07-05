#!/bin/sh

sudo sh -e .travis/scripts/apt-get.sh
sudo sh -e .travis/scripts/apache2-vhost.sh "[myapp].local"
sudo sh -e .travis/scripts/apache2-configure.sh "[myapp].local"
sh -e .travis/scripts/mysql.sh "[mydatabase]"
sh -e .travis/scripts/sahi-install.sh

sh -e .travis/scripts/sf2-configure.sh "[mydatabase]"
sh -e .travis/scripts/behat-configure.sh "[myapp].local" "[mybrowser]"
sh -e .travis/scripts/sahi-configure.sh
sh -e .travis/scripts/sf2-init.sh
sh -e .travis/scripts/sahi-start.sh

phpunit
php behat.phar
