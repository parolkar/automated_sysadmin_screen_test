class site::apache-modules{
    # configure apache modules here
    # example
    # exec{"apache_module_enable_rewrite":
    #     command => "/usr/sbin/a2enmod rewrite",
    #     unless => "/usr/sbin/apachectl -M | grep rewrite_module -i",
    #     require => Package['apache2'],
    #     notify => Service['apache2'];

    #     "apache_module_enable_ssl":
    #     command => "/usr/sbin/a2enmod ssl",
    #     unless => "/usr/sbin/apachectl -M | grep ssl_module -i",
    #     require => Package['apache2'],
    #     notify => Service['apache2'];
    # }
}