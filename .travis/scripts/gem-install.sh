#!/bin/sh

EXTRA_PACKETS=""
if [ "$1" ]
then
    EXTRA_PACKETS="$1"
fi

echo "---> Starting $(tput bold ; tput setaf 2)gems installation$(tput sgr0)"
echo "---> Gems to install : $(tput bold ; tput setaf 3)$EXTRA_PACKETS$(tput sgr0)"

sudo gem install $EXTRA_PACKETS
