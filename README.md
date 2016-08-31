# yorkspace-vagrant

## Prerequisite
Download and install [Vagrant](https://www.vagrantup.com/downloads.html).
Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

## Install vagrant-hostsupdater plugin 
    vagrant plugin install vagrant-hostsupdater

## Bring up the box
If you would like to preload the database with dspace daily postgresql database dump, you can copy the dspace.daily.dmp file to yorkspace-vagrant directory prior to provisioning the box.
    cd yorkspace-vagrant && vagrant up
