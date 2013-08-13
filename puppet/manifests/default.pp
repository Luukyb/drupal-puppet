class { 'apt':
  always_apt_update    => false,
  proxy_host           => false,
  purge_sources_list   => false,
  purge_sources_list_d => false,
  purge_preferences_d  => false
}
include apt

class { 'apache': }

#apache::dotconf { 'custom':
#  content => 'EnableSendfile Off',
#}

apache::module { 'rewrite': }

apache::vhost { 'vagrant.local':
  server_name   => 'vagrant.local',
  serveraliases => [
    'www.vagrant.local'
  ],
  docroot       => '/vagrant/drupal-project',
  port          => '80',
  env_variables => [],
  priority      => '1',
  directory_allow_override   => 'All',
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
