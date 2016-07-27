class apache {
	exec { 'apt-update':
		command => '/usr/bin/apt-get update'
	}	
	package { 'apache2':
		require => Exec['apt-update'],
        	ensure => present,
	}

	service { 'apache2':
        	ensure  => running,
        	require => Package['apache2'],
	}

	file { '/var/www/html/index.html':
        	content => "<h1> hello </h1>",
		
        	require => Package['apache2'],
	}
	
	@@apache { 'server_name':
		name => $fqdn,
		tag => 'web_server'
	}
	Apache <<| tag == 'web_server' |>>{
	}

}


