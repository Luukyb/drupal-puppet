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
  port    => '80',
  rewrite_base => '/',
}

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
