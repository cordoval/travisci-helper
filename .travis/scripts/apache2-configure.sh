#!/bin/sh

echo "---> Applying $(tput bold ; tput setaf 2)apache2 configuration$(tput sgr0)"

sudo a2enmod rewrite
sudo a2ensite virtualhost.local

echo "---> Restarting $(tput bold ; tput setaf 2)apache2$(tput sgr0)"

sudo /etc/init.d/apache2 restart
