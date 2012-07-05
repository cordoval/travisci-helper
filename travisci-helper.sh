#!/bin/sh

sudo sh -e .travis/scripts/apt-get.sh
sudo sh -e .travis/scripts/apache2-vhost.sh "travisci-behat.local"
sudo sh -e .travis/scripts/apache2-configure.sh
sh -e .travis/scripts/mysql.sh
sh -e .travis/scripts/sahi-install.sh

sh -e .travis/scripts/sf2-configure.sh
sh -e .travis/scripts/behat-configure.sh "travisci-behat.local" "phantomjs"
sh -e .travis/scripts/sahi-configure.sh
sh -e .travis/scripts/sf2-init.sh
sh -e .travis/scripts/sahi-start.sh

php behat.phar