#!/bin/sh
export HOST="myapp.local"
export DATABASE="mydatabase"
export BROWSER="phantomjs"

sh -e .travis/scripts/apt-get.sh
sh -e .travis/scripts/apache2-vhost.sh $HOST
sh -e .travis/scripts/apache2-configure.sh $HOST
sh -e .travis/scripts/mysql.sh $DATABASE
sh -e .travis/scripts/sahi-install.sh

sh -e .travis/scripts/sf2-configure.sh $DATABASE
sh -e .travis/scripts/behat-configure.sh $HOST $BROWSER
sh -e .travis/scripts/sahi-configure.sh
sh -e .travis/scripts/sf2-init.sh
sh -e .travis/scripts/sahi-start.sh

# phpunit
# php behat.phar
# travis-lint
