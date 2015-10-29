class pkbuilder::migrate {

exec { 'migrate':
 cwd => "/home/root/pkbuilder",
 provider => shell,
 user => root,
 command => ". venv/bin/activate && python manage.py migrate",
 refreshonly => true,
 #notify => Exec[‘migrate-forum’],
 }


#class { 'docker':
#  manage_kernel => false,
#}

#  package { "python-pip": ensure => installed, }

#  package { "python-virtualenv": ensure => installed, }
 

}
