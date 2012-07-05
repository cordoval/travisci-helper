#!/bin/sh

echo "---> Starting $(tput bold ; tput setaf 2)Sahi installation$(tput sgr0)"

wget -O sahi_20110719.zip "http://downloads.sourceforge.net/project/sahi/sahi-v35/20110719/sahi-src_20110719.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsahi%2Ffiles%2Fsahi-v35%2F20110719%2F&ts=1341337630&use_mirror=freefr"
unzip sahi_20110719.zip -d ~/
sudo chmod +x ~/sahi/bin/sahi.sh