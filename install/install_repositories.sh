#!/bin/sh

sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get -qqy install software-properties-common python-software-properties

echo "Adding R cran repositories"
version=`lsb_release -r | awk '{ print $2;}'`

# This is for Ubuntu 22.04
echo "deb https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" | sudo tee -a /etc/apt/sources.list

wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo apt update

sudo apt-get update -qq

