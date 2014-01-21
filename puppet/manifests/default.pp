# Define run stage 'pre'
stage { 'pre':
  before => Stage['main']
}

# Add the baseconfig module to the new 'pre' run stage
class { 'base':
  stage => 'pre'
}

# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

Exec {
  path => '/usr/bin:/bin:/usr/sbin:/sbin',
}

# Base module performs some utility functions before the primary stack is
# set up. On a first run, install some utility packages, execute the
# postinstall script, then remove it.
include base

# Information for setting up the server. Defaults to hostname defined in
# Vagrantfile.
$project = "${hostname}"

# Override server to change the server, default is Apache.
$server = "apache"

# Override lang to change the language, default is PHP.
$lang = "php"

# Override db to change the database, default is mysql.
$db = "mysql"

$HOME = '/home/vagrant'

class { "${server}" :
  hostname => "${project}",
}

class { "${lang}" : }

class { "${db}" : }

class { "drupal" : }
