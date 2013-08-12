class { 'apt':
  always_apt_update    => false,
  proxy_host           => false,
  purge_sources_list   => false,
  purge_sources_list_d => false,
  purge_preferences_d  => false
}

# Installs default Apache modules based on lucid
class { 'apache':
  default_mods => true,
  mpm_module => 'prefork',
}

# TODO: https://drupal.org/requirements/php
include apache::mod::php

apache::mod { 'rewrite': }

# Clean URL requirements 
# @see https://drupal.org/node/15365
apache::vhost { 'vagrant.local':
  docroot => '/var/www/drupal-project',
  #options => 'Indexes', 'MultiViews', 'FollowSymLinks',
  directories => [ { path => '/var/www/drupal-project', allow_override => ['All'] }],
  #directories => [ { path => '/var/www/drupal-project, allow_override => ['AuthConfig', 'Indexes'] } ],
  port    => '80',
  rewrite_base => '/',
  # rewrite_cond => [ '%{REQUEST_FILENAME} !-f', '%{REQUEST_FILENAME} !-d'],
  # rewrite_rule => '^(.*)$ index.php?q=$1 [L,QSA]',
}

#class webserver {
  # Setups the virtual host
#  file { '/etc/apache2/sites-enabled/site.conf':
#    source  => '/vagrant/puppet/config/site.conf',
#    notify  => Service['apache2'],
#    require => Package['apache2'],
#  }
#}

#include webserver

class { 'mysql::server':
  config_hash => { 'root_password' => 'root' }
}
mysql::db { 'drupal':
  user     => 'drupal',
  password => 'drupal',
  host     => 'localhost',
  grant    => ['all'],
}

include php

include development

# Symlink in /var/www
file { '/var/www/drupal-project':
   ensure => 'link',
   target => '/vagrant/drupal-project',
}
