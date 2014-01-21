# Apache2 virtualhost.
# Setting disable causes the specified virtualhost to be disabled.
define apache::virtualhost (
  $hostname = $title,
  $docRoot = '/var/www/drupal',
  $disable = "",
) {

$apachePath = "/etc/apache2"

  if $disable {
    exec { 'dissite':
      onlyif  => "[ -f ${apachePath}/sites-enabled/*${hostname}* ]",
      command => "a2dissite ${hostname}",
      require => Package['apache2'],
      notify  => Service['apache2'],
    }
  } else {
    file { "${apachePath}/sites-available/${hostname}":
      ensure  => present,
      content => template("apache/vhost.erb"),
      require => Package['apache2'],
      before  => Exec['ensite'],
    }

    exec { 'ensite':
      command => "a2ensite ${hostname}",
      creates => "${apachePath}/sites-enabled/${hostname}",
      notify  => Service['apache2'],
    }
  }
}
