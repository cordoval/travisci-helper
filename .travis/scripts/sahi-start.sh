#!/bin/sh

echo "---> $(tput bold ; tput setaf 2)Starting Sahi$(tput sgr0)"

cd ~/sahi/bin; pwd
./sahi.sh &
sleep 3
cd -;