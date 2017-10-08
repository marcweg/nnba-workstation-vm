#!/usr/bin/env bash

# -
echo "127.0.0.1 localhost.localdomain localhost vagrant-VirtualBox 127.0.0.1 nnba.loc" > /etc/hosts

# -
sudo apt-get update -y
sudo apt-get autoremove -y --purge
sudo apt-get autoclean -y
sudo apt-get clean -y
sudo rm -rf /var/cache/apt/archives/*
sudo find /var/log -name '*.gz' -delete

# -
cd /vagrant
(echo; echo;) | sh ./scripts/provision.sh