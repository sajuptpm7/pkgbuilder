class pkgbuilder::installdbuild {
exec { 'Install python-dbuild':
 cwd => "${pkgbuilder::install_dir}/pkgbuilder",
 provider => shell,
 user => "${pkgbuilder::username}",
 command => ". venv/bin/activate && pip install -e 'git+https://github.com/hkumarmk/python-dbuild@master#egg=Package'",
 refreshonly => false,
# require => Class['docker'],
 #notify => Exec[‘migrate-forum’],
 }


#class { 'docker':
#  manage_kernel => false,
#}

#  package { "python-pip": ensure => installed, }

#  package { "python-virtualenv": ensure => installed, }
 

}
