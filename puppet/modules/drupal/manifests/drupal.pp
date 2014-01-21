class drupal::install {

    exec { "download-drupal":
        require => Class['php::pear'],
        cwd => "/var/www",
        command => "/usr/bin/drush dl drupal-8.x-dev",
        creates => "/home/vagrant/drupal-8.x-dev",
    }

    file { '/var/www/drupal':
        require => Exec["download-drupal"],
        ensure => 'symlink',
        target => '/home/vagrant/drupal-8.x-dev',
    }

    exec { "drupal-install":
        require => File['/var/www/drupal'],
        cwd => "/var/www/drupal",
        command => "/usr/bin/drush si",
        creates => "/var/www/drupal/sites/default/settings.php",
    }

    drupal::module {
        [
            # "admin_menu",
            # "cck",
            # "comment_notify",
            # "contact_forms",
            # "filefield",
            # "google_analytics",
            # "imagecache",
            # "nodewords",
            # "views",
            # "views_attach",
            # "views_bulk_operations",
            # "weblinks"
        ]:
    }

    define module() {
        exec { "install-module-$name":
            cwd => "/var/www/drupal/sites/all/modules",
            command => "/usr/bin/drush dl $name",
            creates => "/var/www/drupal/sites/all/modules/$name",
        }
    }
}
