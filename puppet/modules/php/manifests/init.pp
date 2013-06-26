# Install Drush and the default version of php from the box.
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
  package { "php5-gd":
    ensure => present,
  }
  # Drush is included in the php packages for lucid. 
  # See http://packages.ubuntu.com/en/lucid/php/
  package { "drush":
    ensure => present,
  }
}