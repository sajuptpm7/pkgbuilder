class pkgbuilder::migrate {

exec { 'migrate':
 cwd => "${pkgbuilder::install_dir}/pkgbuilder",
 provider => shell,
 user => "${pkgbuilder::username}",
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
