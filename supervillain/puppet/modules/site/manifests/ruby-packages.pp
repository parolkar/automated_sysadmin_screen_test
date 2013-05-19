class site::ruby-packages{
     package { "bundler":
         provider => "gem",
         ensure => installed,
         require => Package['rubygems'],
     }
    package { "rack":
         provider => "gem",
         ensure => installed,
         require => Package['rubygems'],
     }
    package { "thin":
         provider => "gem",
         ensure => installed,
         require => [Package['rubygems'],Package['ruby1.9.1-dev']],
     }
    package { "foreman":
         provider => "gem",
         ensure => installed,
         require => Package['rubygems'],
     }
    package { "rspec":
         provider => "gem",
         ensure => installed,
         require => Package['rubygems'],
     }
}