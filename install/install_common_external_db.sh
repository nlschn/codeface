#!/bin/bash
# Copyright Roger Meier <roger@bufferoverflow.ch>
# SPDX-License-Identifier:	Apache-2.0 BSD-2-Clause GPL-2.0+ MIT WTFPL

echo "Providing common binaries and libraries"

sudo DEBIAN_FRONTEND=noninteractive apt-get -qqy install sinntp texlive default-jdk \
	mysql-common mysql-client libgraphviz-dev libarchive13 libhunspell-dev \
	python3-dev universal-ctags nodejs git subversion libxslt1-dev \
	sloccount graphviz doxygen libxml2-dev libcurl4-openssl-dev \
	libmysqlclient-dev libcairo2-dev libxt-dev libcairo2-dev libmysqlclient-dev \
	astyle xsltproc libxml2 libxml2-dev python3 build-essential libyaml-dev \
	libxml2-dev libcurl4-openssl-dev xorg-dev libx11-dev libgles2-mesa-dev \
	gfortran libglu1-mesa-dev libxt-dev libpoppler-dev libpoppler-glib-dev python3-mock \
	libapparmor-dev libpoppler-cpp-dev python3-pip libmagick++-dev
