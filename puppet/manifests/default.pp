Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

package { ['vim', 'curl', 'git'] :
	ensure  => 'installed',
	require => Exec['apt-get update'],
}

class system-update {
	exec { 'apt-get update':
		command => 'apt-get update',
	}
	
	$sysPackages = [ "build-essential" ]
	package { $sysPackages:
		ensure => "installed",
		require => Exec['apt-get update'],
	}
}

# Included Modules
include apache
include system-update
include php
include mysql
include github-pages
include vhost