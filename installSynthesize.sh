#!/usr/bin/env bash


if [ $# -ne 0 ]
then "Vagrant"
# In vagrant
git clone https://github.com/obfuscurity/synthesize.git
cd synthesize
vagrant up
else
# Manually
echo "Manually"
ssh $1 # server # dummyNode
git clone https://github.com/obfuscurity/synthesize.git
cd synthesize
sudo ./install
fi

