class makerspace::git {
    vcsrepo { "/home/vagrant/makerspace.se":
        ensure => present,
        provider => git,
        source => 'https://github.com/makerspace/makerspace.se.git',
        revision => 'master'
    }

    vcsrepo { "/home/vagrant/internal":
        ensure => present,
        provider => git,
        source => 'https://github.com/makerspace/internal.git',
        revision => 'master'
    }
}
