# yorkspace-vagrant

## Prerequisite
Download and install [Vagrant](https://www.vagrantup.com/downloads.html).

Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

## Install vagrant-hostsupdater plugin 
    vagrant plugin install vagrant-hostsupdater

## Clone this repo
    git clone git@github.com:yorkulibraries/yorkspace-vagrant.git

## Bring up the box
If you would like to preload the database with dspace daily postgresql database dump, you can copy the dspace.daily.dmp file to yorkspace-vagrant directory prior to provisioning the box.
    
    cd yorkspace-vagrant && vagrant up

## SSH into your box
    vagrant ssh

## Making changes 
After successfully bringing up your YorkSpace instance, you should be able to make changes to the YorkSpace files. They are placed in yorkspace-vagrant/source/DSpace directory. This directory is also accessible inside your box as /yorkspace/source/DSpace

## Packaging and update your instance
    dspace-package
    dspace-update

## Pushing changes to github
You can make changes to files in yorkspace-vagrant/source/DSpace and then commit/push to github. Before you can do that, you need to change the origin to our DSpace github repo to use SSH instead of HTTPS.
    
    cd source/DSpace 
    git remote set-url origin git@github.com:yorkulibraries/DSpace.git
