#!/bin/sh

DBNAME="myapp_test"
if [ "$1" ]
then
    DBNAME="$1"
fi

echo "---> Creating $(tput bold ; tput setaf 2)MySQL database$(tput sgr0) : $(tput bold ; tput setaf 3)$DBNAME$(tput sgr0)"

mysql -uroot -e "DROP DATABASE IF EXISTS $DBNAME; CREATE DATABASE $DBNAME;"
