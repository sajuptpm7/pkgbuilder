class pkbuilder::installdbuild {
exec { 'Install python-dbuild':
 cwd => "/home/root/pkbuilder",
 provider => shell,
 user => root,
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
