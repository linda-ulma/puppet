class apache {

	package { 'apache2':
		ensure => 'installed',
		allowcdrom => 'true',
	}

	file { '/var/www/html/index.html':
		content => 'Hello',
		require => Package['apache2'],
	}

	file { '/etc/apache2/mods-enabled/userdir.load':
		 ensure	 => 'link',
		 target	 => '/etc/apache2/mods-available/userdir.load',
		 group   => '0',
                 mode    => '0644',
                 owner   => '0',
		 notify  => Service['apache2'],
		 require => Package['apache2'],
	}
	
	file { '/etc/apache2/mods-enabled/userdir.conf':
		 ensure	 => 'link',
		 target	 => '/etc/apache2/mods-available/userdir.conf',
		 group   => '0',
                 mode    => '0644',
                 owner   => '0',
		 notify  => Service['apache2'],
		 require => Package['apache2'],
	}

	service { 'apache2':
		 ensure	 => 'running',
		 enable	 => 'true',
		 require => Package['apache2'],
	}
}
