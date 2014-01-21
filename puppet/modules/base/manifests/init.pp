# Base class
class base {
  # executed at every start up
  exec { 'update':
    command => 'apt-get update',
  }

  package { 'vim':
    ensure  => latest,
    require => Exec['update', 'postinstall'],
  }

  package { 'curl':
    ensure  => latest,
    require => Exec['update', 'postinstall'],
  }

  package { 'git':
    ensure  => latest,
    require => Exec['update', 'postinstall'],
  }

  # Execute the postinstall script that comes with the base box.
  exec { 'postinstall':
    command => '/home/vagrant/postinstall.sh > /dev/null',
    onlyif  => 'test -f /home/vagrant/postinstall.sh',
    timeout => 0,
    require => Exec['update'],
  }

  # After execution, remove the postinstall script.
  exec { 'rm-postinstall':
    command => 'rm -rf /home/vagrant/postinstall.sh',
    onlyif  => 'test -f /home/vagrant/postinstall.sh',
    require => Exec['postinstall'],
  }
}
