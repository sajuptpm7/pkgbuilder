class pkbuilder::migrate {

exec { 'migrate':
 cwd => "${pkbuilder::install_dir}/pkbuilder",
 provider => shell,
 user => "${pkbuilder::username}",
 command => ". venv/bin/activate && python manage.py migrate",
 refreshonly => false,
 #notify => Exec[‘migrate-forum’],
 }


#class { 'docker':
#  manage_kernel => false,
#}

#  package { "python-pip": ensure => installed, }

#  package { "python-virtualenv": ensure => installed, }
 

}
