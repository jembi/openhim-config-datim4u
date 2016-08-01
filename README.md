OpenHIM config package - for DATIM4U
====================================

This repo allows you to create a debian package that will automatically
configure the openhim-core server installed by the openhim-core debian package.

This package will also install two mediators required by the DATIM4U project:
the file-queue mediator which allows async operations of the ADX request and the
DATIM mediator which orchestrates the DATIM transaction.

The mediators are setup so that a request flows through them in this order:

```
file-queue -> datim
```

It has been configured specifically for the DATIM project. If you would like to
create a config package for the OpenHIM for your own project, then
[see here](https://github.com/jembi/openhim-config-pkg).

When the config package is installed it will ask the user the openhim server
address and for a username and password to use to import the config. To automate
this you may supply the value before installing the package. Eg.:

```
echo "openhim-config-datim4u openhim-config/host string localhost" | debconf-set-selections
echo "openhim-config-datim4u openhim-config/port string 8080" | debconf-set-selections
echo "openhim-config-datim4u openhim-config/username string root@openhim.org" | debconf-set-selections
echo "openhim-config-datim4u openhim-config/password password openhim-password" | debconf-set-selections
```

After installing the package
----------------------------

When installed, the `load-initial-data.sh` script will be placed in `/etc/openhim/`
along with the data if you ever need to run it again.

The two mediators are installed in /usr/share/ each of them have a config folder
where you can control the config. Default config is added automatically for you,
however, you may change these as necessary.

After the package is installed the user must manually set the following:

* The certificate for the 2 client must be added to the trusted list in
  the keystore and linked to each client, also their basic auth passwords must
  be reset from the default of 'test'.
* Then endpoint that the DATIM mediator will forward a response to can be set via
  mediator config in the OpenHIM-console
* Similarly, the upstream OpenHIM Global (acting as a DHIS instance) instance can
  be configured in the OpenHIM-console as well via mediator config.
* The two mediators are configured to use a mediators@openhim.org user to communicate
  with core. The password of this user should be changed in the OpenHIM-cosnole
  and then it should be updated in each of the mediators `config.json` files.
* The /tls folder of the openhim DATIM mediator will need to be updated with its
  proper cert and key file and a ca file for the Global IL.
* The CSD channel's route will need to be updated to point to the Global IL.

Building the package
--------------------

To copy in the mediators edit and run `./cp-mediators-into-pkg.sh`. You will have
to setup their config for a DATIM environment.

Execute `.create-deb.sh` to create the package. This script will ask you if you
want to upload to launchpad or just create a .deb file.
