#!/bin/sh

BASEDIR=$(dirname $0)
BASEDIR=$(readlink -f "$BASEDIR/..")
ROOTDIR=$(readlink -f "$BASEDIR/..")

VHOSTNAME="virtualhost.local"
if [ "$1" ]
then
    VHOSTNAME="$1"
fi

echo "---> Starting $(tput bold ; tput setaf 2)virtual host creation$(tput sgr0)"
echo "---> Working directory : $(tput bold ; tput setaf 3)$BASEDIR$(tput sgr0)"
echo "---> Root directory : $(tput bold ; tput setaf 3)$ROOTDIR$(tput sgr0)"
echo "---> Virtualhost name : $(tput bold ; tput setaf 3)$VHOSTNAME$(tput sgr0)"

sed s?%basedir%?$ROOTDIR? "$BASEDIR/apache2/virtualhost.local-dist" | sed s/%hostname%/$VHOSTNAME/ > $VHOSTNAME
sudo mv $VHOSTNAME /etc/apache2/sites-available/$VHOSTNAME

echo "---> $(tput bold ; tput setaf 2)Adding host to /etc/hosts$(tput sgr0) :"
echo "127.0.0.1    $VHOSTNAME" | sudo tee -a /etc/hosts
