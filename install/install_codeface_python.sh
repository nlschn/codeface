#!/bin/sh
# Copyright Roger Meier <roger@bufferoverflow.ch>
# SPDX-License-Identifier:	Apache-2.0 BSD-2-Clause GPL-2.0+ MIT WTFPL

echo "Providing codeface python"

sudo pip3 install --upgrade setuptools
sudo pip3 install --upgrade mock
sudo pip3 install --upgrade subprocess32

# Only development mode works
# install fails due to R scripts accessing unbundled resources!
# TODO Fix the R scripts
sudo python3 setup.py develop
