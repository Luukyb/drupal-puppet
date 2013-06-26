# drupal-puppet

A simple and understandable Drupal &amp; LAMP stack, based on ubuntu lucid with Vagrant and Puppet.

This is a simple version of a LAMP stack, quickly optimized for Drupal.
It does include : Apache, MySQL, PHP and Drush.

Puppet is using modules from puppet labs for Apache and MySQL.
[https://github.com/puppetlabs/puppetlabs-apache](https://github.com/puppetlabs/puppetlabs-apache)
[https://github.com/puppetlabs/puppetlabs-mysql](https://github.com/puppetlabs/puppetlabs-mysql)

## How to use

Download and Install the last version of VirtualBox
[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

Install vagrant
[http://downloads.vagrantup.com](http://downloads.vagrantup.com)

Download ubuntu lucid vagrant box

	vagrant box add base http://files.vagrantup.com/lucid32.box

Download drupal and place it into a folder called drupal-project in your repository.

Same as for the Drupal Vagrant project, add this line to your /etc/hosts (or windows equivalent)

	33.33.33.10 	vagrant.local

[https://drupal.org/project/vagrant](https://drupal.org/project/vagrant)

You are now ready to go!

	vagrant up

Access to your drupal site
[http://vagrant.local](http://vagrant.local)
