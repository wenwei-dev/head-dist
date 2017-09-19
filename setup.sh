#!/usr/bin/env bash

set -e

BASEDIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

sudo apt-get install dpkg-sig reprepro nginx gnupg-agent
sudo mkdir -p /var/www/apt-repo/
sudo cp -r conf /var/www/apt-repo/
sudo mkdir -p /var/www/apt-repo/incoming
sudo chown $(id -un):$(id -gn) -R /var/www/apt-repo
sudo cp $BASEDIR/nginx.conf /etc/nginx/sites-enabled/default
sudo cp $BASEDIR/incoming /usr/local/bin/incoming
