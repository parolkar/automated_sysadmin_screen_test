class site::php-packages{
    # configure php packages here
    # example
    # $phpPackageList = [
    #     "php5-mysqlnd",
    #     "php5-gd",
    #     "php5-curl",
    #     "php5-xdebug",
    #     "php-pear",
    #     "php5-xmlrpc",
    #     "php5-mcrypt",
    #     "libapache2-mod-php5",
    #     "phpunit"
    # ]

    # package { $phpPackageList:
    #     require => [Package['apache2'], Package['mysql-server']],
    #     notify => Service['apache2']
    # }
}