class pkgbuilder::pithon {
 class { 'python':
 version => 'system',
 dev => true,
 virtualenv => true,
 }
#  package { "python-pip": ensure => installed, }

#  package { "python-virtualenv": ensure => installed, }
   package { "libmysqlclient-dev": ensure => installed, }
 python::virtualenv { "${pkgbuilder::install_dir}/pkgbuilder/venv":
 ensure => present,
 version => 'system',
 systempkgs => false,
 distribute => true,
 requirements => "${pkgbuilder::install_dir}/pkgbuilder/requirements.txt",
 owner => "${pkgbuilder::username}",
 require => [Package['libmysqlclient-dev'],Class['python']],
 #notify => Exec[‘syncdb’],
 
}
}
