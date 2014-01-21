# Basic PHP class
class php {
  package { 'libapache2-mod-php5':
    ensure  => latest,
    require => Package['apache2'],
    notify  => Service['apache2'],
  }

  package { "php5-curl":
    ensure  => latest,
    require => Package['apache2', 'libapache2-mod-php5'],
    notify  => Service['apache2'],
  }

  apache::mod { "php5":
    action => "a2enmod",
    reqs   => Package['apache2', 'libapache2-mod-php5'],
    notifs => Service['apache2']
  }

  include php::pear, php::tools
}
