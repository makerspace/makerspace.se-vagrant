# Install some basic PHP tools
class php::tools {
  exec { 'composer':
    command => 'curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/bin/composer',
    creates => '/usr/bin/composer',
  }

}
