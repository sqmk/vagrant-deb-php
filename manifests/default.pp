file { 'php.ini':
  path    => '/tmp/php.ini.bak',
  ensure  => present,
  mode    => 0755,
  content => 'a value'
} 

class { 'apt':
  always_apt_update => true,
}

class { 'redis': version => '2.6.14', }

class { 'mysql::server':
  config_hash => { 'root_password' => 'password' },
}

class { 'memcached':
  max_memory => '12%'
}

class { 'rabbitmq::server': }

package { "postfix":
  ensure => "installed"
}

package { "dovecot-core":
  ensure => "installed"
}