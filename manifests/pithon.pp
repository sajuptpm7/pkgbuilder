class pkbuilder::pithon {
 class { 'python':
 version => 'system',
 dev => true,
 virtualenv => true,
 }
#  package { "python-pip": ensure => installed, }

#  package { "python-virtualenv": ensure => installed, }
   package { "libmysqlclient-dev": ensure => installed, }
 python::virtualenv { "${pkbuilder::install_dir}/pkbuilder/venv":
 ensure => present,
 version => 'system',
 systempkgs => false,
 distribute => true,
 requirements => "${pkbuilder::install_dir}/pkbuilder/requirements.txt",
 owner => "${pkbuilder::username}",
 require => [Package['libmysqlclient-dev'],Class['python']],
 #notify => Exec[‘syncdb’],
 
}
}
