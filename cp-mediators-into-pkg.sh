#!/bin/bash
set -e

SRCDIR="/home/ryan/git"

mkdir -p targets/trusty/usr/share
rm -rf targets/trusty/usr/share/*

echo "Cloning base mediators..."
git clone https://github.com/jembi/openhim-mediator-datim.git targets/trusty/usr/share/openhim-mediator-datim
git clone https://github.com/jembi/openhim-mediator-file-queue.git targets/trusty/usr/share/openhim-mediator-file-queue
git clone https://github.com/jembi/openhim-mediator-adx-csd-mapper.git targets/trusty/usr/share/openhim-mediator-adx-csd-mapper
echo "Done."

echo "Configuring mediators..."
cp -r mediator-config/openhim-mediator-datim/config targets/trusty/usr/share/openhim-mediator-datim/
cp -r mediator-config/openhim-mediator-file-queue/config targets/trusty/usr/share/openhim-mediator-file-queue/
cp -r mediator-config/openhim-mediator-adx-csd-mapper/config targets/trusty/usr/share/openhim-mediator-adx-csd-mapper/
echo "Done."

echo "Downloading module dependencies..."
(cd targets/trusty/usr/share/openhim-mediator-datim/ && npm install)
(cd targets/trusty/usr/share/openhim-mediator-file-queue/ && npm install)
(cd targets/trusty/usr/share/openhim-mediator-adx-csd-mapper/ && npm install)
echo "Done."
