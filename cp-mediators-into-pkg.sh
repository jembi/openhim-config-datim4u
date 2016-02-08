#!/bin/bash
set -e

SRCDIR="/home/ryan/git"

mkdir -p targets/trusty/usr/share

cp -r $SRCDIR/openhim-mediator-datim targets/trusty/usr/share
cp -r $SRCDIR/openhim-mediator-file-queue targets/trusty/usr/share
cp -r $SRCDIR/openhim-mediator-adx-csd-mapper targets/trusty/usr/share
