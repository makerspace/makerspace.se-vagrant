# Install pear and some basic pear packages.
class php::pear {
  $packages = ['build-essential', 'php-pear']

  package { $packages:
    ensure  => latest,
    require => Package['libapache2-mod-php5'],
  }

  # Enable autodiscover so that phpunit can be installed.
  exec { "auto_discover":
    command => "pear config-set auto_discover 1",
    onlyif  => "pear config-show | grep 'auto_discover *<not set>'",
    require => Package['build-essential', 'php-pear'],
  }

  pear-package { 'pear.phpunit.de/PHPUnit':
    require => Exec['auto_discover'],
  }
}
