#!/bin/sh

BASEDIR=$(dirname $0)
BASEDIR=$(readlink -f "$BASEDIR/..")

VHOSTNAME="virtualhost.local"
if [ "$1" ]
then
    VHOSTNAME="$1"
fi

echo "---> Starting $(tput bold ; tput setaf 2)Sahi configuration$(tput sgr0)"
echo "---> Working directory : $(tput bold ; tput setaf 3)$BASEDIR$(tput sgr0)"

sed s?%basedir%?$BASEDIR/sahi? $BASEDIR/sahi/browser_types.xml-dist > ~/sahi/userdata/config/browser_types.xml