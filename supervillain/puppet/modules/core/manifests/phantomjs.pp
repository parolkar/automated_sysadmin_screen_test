class core::phantomjs{
	$packages = [
        'fontconfig',
        'libfreetype6'
    ]

    package { $packages: }

    exec { "get_phantomjs_source":
        command => ["wget -N http://phantomjs.googlecode.com/files/phantomjs-1.6.1-linux-i686-dynamic.tar.bz2 && tar xvfj phantomjs-1.6.1-linux-i686-dynamic.tar.bz2"],
        cwd => "/home/vagrant/",
        path => ["/usr/bin/", "/bin/"],
        creates => "/home/vagrant/phantomjs-1.6.1-linux-i686-dynamic",
    }
    file { "/usr/local/bin/phantomjs":
        ensure => link,
        target => '/home/vagrant/phantomjs-1.6.1-linux-i686-dynamic/bin/phantomjs',
        owner => root,
        group => root,
        require => Exec["get_phantomjs_source"],
    }
}