class destructor::test_1 {

  $problem_definition = "
    Problem: This server runs a site http://superstar.admin.com. A secret intelligence agency just reported that this server is going 
    to be flooded with requests from few malicious nodes.Good news is that agency has identified the IP addresses of those hosts. 
    Please block any tcp traffic coming from these addresses.
    
    Note: Please look for file that has list of IPs in same directory as this problem statement. 
  "
  
   file { '/challenges/problem_1.txt':
     content => $problem_definition
    }
  
   file{'IP List':
      path => '/challenges/ip_list.txt',
      ensure => present,
      require => [File['/challenges/problem_1.txt']],
      source => "puppet:///modules/destructor/ip_list.txt",
   }

   host { 'superstar.admin.com':
    ip => $ipaddress,
    host_aliases => 'superstar',
   }   

   package { "hping3":
        ensure => installed,
    }
          
   package { "nginx-full":
        ensure => installed,
   }  
    
   
   file { ["/var/www","/var/www/app"]:
    ensure => "directory",
    owner  => "www-data",
    mode   => 750,
   }
  
   file { '/var/www/index.html':
     content => "Awesome!"
   }
   
  
  
   file{'superstar.admin.com.conf':
      path => '/etc/nginx/sites-enabled/superstar.admin.com.conf',
      ensure => present,
      require => [Package[nginx-full]],
      source => "puppet:///modules/destructor/nginx.superstar.admin.com.conf",
   }
   
   service { 'nginx':
     ensure     => running,
     enable     => true,
     hasrestart => true,
     require    => File['/etc/nginx/sites-enabled/superstar.admin.com.conf'],
     restart    => '/etc/init.d/nginx reload'
   }
  
  
    
}
