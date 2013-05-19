class site::apache-vhosts{
    # configure any vhost-files you need to load here
    # example
    # 
    # file{'foo.vhost':
    #         path => '/etc/apache2/sites-available/foo',
    #         ensure => present,
    #         require => Package['apache2'],
    #         source => "puppet:///modules/site/apache2/foo.vhost",
    #         owner => root,
    #         group => root;
    # }

    # file{'/etc/apache2/sites-enabled/000-foo':
    #         ensure => link,
    #         target => '/etc/apache2/sites-available/foo',
    #         require => [Package['apache2'], File['foo.vhost']],
    #         notify  => Service['apache2'],
    #         owner => root,
    #         group => root;
    # }
}