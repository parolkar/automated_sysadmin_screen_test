class core::mysql5 {
    package { "mysql-client":
        ensure => installed,
    }

    package { "mysql-server":
        ensure => installed,
    }

    service { "mysql":
        name => 'mysql',
        enable => true,
        ensure => running,
        require => Package['mysql-server'],
    } 
}