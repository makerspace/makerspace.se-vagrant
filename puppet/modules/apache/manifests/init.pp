# Apache base class
class apache ($hostname = "project.dev") {
  package { 'apache2':
    name   => 'apache2-mpm-prefork',
    ensure => latest,
  }

  package { 'apache2-prefork-dev':
    ensure  => latest,
    require => Package['apache2'],
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2', 'apache2-prefork-dev'],
  }

  # Enable the rewrite module
  apache::mod { "rewrite":
    reqs   => Package['apache2'],
    notifs => Service['apache2'],
  }

  # Disable the default virtualhost
  apache::virtualhost { "default":
    disable => "true"
  }

  # Set up the parameterized apache2 virtualhost
  apache::virtualhost { "${hostname}": }
}
