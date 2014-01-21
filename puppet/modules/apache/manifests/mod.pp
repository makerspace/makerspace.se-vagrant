# Apache2 module
define apache::mod (
  $mod    = $title,
  $action = "a2enmod",
  $reqs = "",
  $notifs = "",
) {

  if $action == "a2enmod" {
    $cond = "test ! -f /etc/apache2/mods-enabled/${mod}.load"
  } else {
    $cond = "test -f /etc/apache2/mods-enabled/${mod}.load"
  }

  exec { "${mod}":
    command => "${action} ${mod}",
    onlyif => "${cond}",
    require => [ $reqs ],
    notify  => [ $notifs ],
  }
}
