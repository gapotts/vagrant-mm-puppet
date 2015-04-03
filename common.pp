include epel

host { 'localhost':
  ensure => present,
  ip => '127.0.0.1',
  host_aliases =>  [ 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4' ],
}

host { 'localhost6':
  ensure => present,
  ip => '::1',
  host_aliases => 'localhost6.localdomain6',
}

host { 'puppet.example.com':
  ensure => present, 
  ip => '192.168.32.5',
  host_aliases => 'puppet',
}

host { 'node1.example.com':
  ensure => present,
  ip => '192.168.32.10',
  host_aliases => 'node1',
}

host { 'node2.example.com':
  ensure => present,
  ip => '192.168.32.20',
  host_aliases => 'node2',
}