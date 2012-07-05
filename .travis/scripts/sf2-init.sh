#!/bin/sh

echo "---> Starting $(tput bold ; tput setaf 2)Symfony2 project initialization$(tput sgr0)"

bin/vendors install
app/console --env=test doctrine:schema:create
sudo chmod -R 777 app/cache app/logs