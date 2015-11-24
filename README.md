OpenHIM config package - for DATIM
==================================

This repo allows you to create a debian package that will automatically
configure the openhim-core server installed by the openhim-core debian package.

It has been configured specifically for the DATIM project. If you would like to
create a config package for the OpenHIM for your own project, then
[see here](https://github.com/jembi/openhim-config-pkg)

Getting started
---------------

Execute `.create-deb.sh` to create the package. This script will ask you if you
want to upload to launchpad or just create a .deb file.

The `load-initial-data.sh` script will be placed in `/etc/openhim/` along with the
data if you ever need to run it again.
