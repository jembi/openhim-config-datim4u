#!/bin/bash
./cp-mediators-into-pkg.sh
yes n | ./create-deb.sh
git checkout targets/trusty/debian/changelog
vagrant destroy -f
vagrant up
