class pkbuilder::pithon {
 class { 'python':
 version => 'system',
 dev => true,
 virtualenv => true,
 }
#  package { "python-pip": ensure => installed, }

#  package { "python-virtualenv": ensure => installed, }
   package { "libmysqlclient-dev": ensure => installed, }
 python::virtualenv { "/home/root/pkbuilder/venv":
 ensure => present,
 version => 'system',
 systempkgs => false,
 distribute => true,
 requirements => "/home/root/pkbuilder/requirements.txt",
 owner => "root",
 require => [Package['libmysqlclient-dev'],Class['python']],
 #notify => Exec[‘syncdb’],
 
}
}
