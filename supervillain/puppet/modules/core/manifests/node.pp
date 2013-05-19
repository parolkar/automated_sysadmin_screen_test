# node install
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
# sudo apt-get install python-software-properties
# sudo add-apt-repository ppa:chris-lea/node.js
# sudo apt-get update
# sudo apt-get install nodejs npm

class core::node{
	$packageList = [
		'python-software-properties'
	]

	package { $packageList: }

	exec { "install node deps":
		command => "/usr/bin/add-apt-repository ppa:chris-lea/node.js && apt-get update",
	}
	package { "nodejs":
		ensure => installed,
		require => Exec['install node deps'],
	}
	package { "npm":
		ensure => installed,
		require => Exec['install node deps'],
	}
	exec { "install yeoman":
		command => "/usr/bin/npm install -g yeoman",
		require => Package['npm'],
	}
}