# Install a pear package.
define php::pear-package ($pkg = $title) {
  exec { "${pkg}":
    # Only run the installer if pear list returns a non-zero exit status.
    onlyif  => "pear list ${pkg} > /dev/null; [ $? -ne 0 ]",
    command => "pear install ${pkg}",
    require => Package['php-pear'],
  }
}
