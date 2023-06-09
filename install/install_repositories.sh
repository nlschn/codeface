#!/bin/sh

sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get -qqy install software-properties-common python-software-properties

echo "Adding R cran repositories"
version=`lsb_release -r | awk '{ print $2;}'`

REPO="deb https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/"
APTFILE="/etc/apt/sources.list"
# This is for Ubuntu 22.04
if grep -q "$REPO" "$APTFILE" ; then
    echo "R repo is already in sources.list"
else
    echo "Add R repo to sources.list"
    echo "$REPO" | sudo tee -a "$APTFILE"
    wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
fi

sudo apt update

sudo apt-get update -qq

