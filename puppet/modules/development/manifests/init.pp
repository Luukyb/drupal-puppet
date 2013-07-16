# Install Sass and Compass.
class development {
  $devPackages = [ "curl", "rubygems" ]
  package { $devPackages:
    ensure => "installed",
  }

  exec { 'install sass with compass using RubyGems':
    command => 'gem install compass',
    require => Package["rubygems"],
    path => '/usr/bin'
  }
}