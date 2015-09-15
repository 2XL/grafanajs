#!/usr/bin/env bash


if [ ! -f grafana_2.1.3_amd64.deb ]
then
wget https://grafanarel.s3.amazonaws.com/builds/grafana_2.1.3_amd64.deb
fi
sudo apt-get install -y adduser libfontconfig
sudo dpkg -i grafana_2.1.3_amd64.deb


line='deb https://packagecloud.io/grafana/stable/debian/ wheezy main'
more /etc/apt/sources.list | grep $line
status=$?
if [ $status -ne 0 ]
then
echo $line >> /etc/apt/sources.list
fi

sudo apt-get --force-yes install -y curl

curl https://packagecloud.io/gpg.key | sudo apt-key add -


# apt update
sudo apt-get update
sudo apt-get install grafana


# optional
sudo apt-get --force-yes install -y apt-transport-https

# Start the server

sudo service grafana-server start

# Configure it to start at boottime
#sudo update-rc.d grafana-server defaults 95 10


