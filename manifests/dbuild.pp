class pkbuilder::dbuild {
class { 'docker':
  manage_kernel => false,
}

#  package { "python-pip": ensure => installed, }

#  package { "python-virtualenv": ensure => installed, }
 

}
