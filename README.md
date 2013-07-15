# drupal-puppet

A simple and understandable Drupal &amp; LAMP stack, based on ubuntu with Vagrant and Puppet.

This is a simple version of a LAMP stack, quickly optimized for Drupal.
It does include : Apache, MySQL, PHP and Drush.

Puppet is using modules from puppet labs for Apache and MySQL.
[https://github.com/puppetlabs/puppetlabs-apache](https://github.com/puppetlabs/puppetlabs-apache)
[https://github.com/puppetlabs/puppetlabs-mysql](https://github.com/puppetlabs/puppetlabs-mysql)

## How to use

This repository contains submodules. Clone this repo with the option "recursive" : git clone --recursive https://github.com/Luukyb/drupal-puppet.git

Download and Install the last version of VirtualBox
[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

Install vagrant
[http://downloads.vagrantup.com](http://downloads.vagrantup.com)

Download ubuntu (precise recommanded) vagrant box

	vagrant box add base http://files.vagrantup.com/precise64.box

Download your drupal project and place it into a folder called drupal-project in your repository.

Same as for the Drupal Vagrant project, add this line to your /etc/hosts (or windows equivalent)

	33.33.33.10 	vagrant.local

[https://drupal.org/project/vagrant](https://drupal.org/project/vagrant)

You are now ready to go!

	vagrant up

Access to your drupal site
[http://vagrant.local](http://vagrant.local)

## MySQL information

MySQL Database name : drupal

MySQL User : drupal / drupal
