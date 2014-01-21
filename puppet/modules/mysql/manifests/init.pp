# Basic MySQL class.
class mysql {
  $password = root

  package { 'mysql-server':
    ensure => latest,
  }

  package { 'libapache2-mod-auth-mysql':
    ensure  => latest,
    require => Package['apache2'],
    notify  => Service['apache2'],
  }

  package { 'php5-mysql':
    ensure  => latest,
    require => Package['libapache2-mod-php5'],
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server']
  }

  exec { 'mysql-passwd':
    command => 'mysqladmin -uroot password {$password}',
    unless  => 'mysqladmin -uroot -p{$password} status',
    require => Package['mysql-server']
  }
}
