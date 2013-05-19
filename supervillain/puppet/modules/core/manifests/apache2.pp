class core::apache2{
    package { "apache2":
        ensure => installed,
    }

    service { "apache2":
        enable => true,
        ensure => running,
        hasrestart => true,
        require => Package["apache2"],
    }

    file{'apache.envvars':
            path => '/etc/apache2/envvars',
            ensure => present,
            require => Package[apache2],
            source => "puppet:///modules/core/apache2/envvars",
            owner => root,
            group => root,
            notify  => Service['apache2'],
            mode => 0644;
    }
}