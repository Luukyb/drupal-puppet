exec { "apt-get update":
  command => "apt-get update",
  path => "/usr/bin",
}

class apache {
  package { "apache2":
    ensure  => present,
    require => Exec["apt-get update"],
  }
  service { "apache2":
    ensure  => "running",
    require => Package["apache2"],
  }
  #notify {"This actually did something":}
}
include apache

class php {
  package { "php5":
    ensure  => present,
  }
  package { "php5-cli":
    ensure => present,
  }
  package { "php5-mysql":
    ensure => present,
  }
  # Drush is included in the php packages for lucid. 
  # See http://packages.ubuntu.com/en/lucid/php/
  package { "drush":
    ensure => present,
  }
}
include php

class mysql {
  package { "mysql-server":
    ensure  => present,
  }
  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }
  exec { "set-mysql-password":
    path    => ["/usr/bin"],
    command => "mysqladmin -uroot password root",
    require => Service["mysql"],
  }
}
include mysql

# Symlink in /var/www
file { '/var/www/project-dev':
   ensure => 'link',
   target => '/vagrant/project-dev',
}
