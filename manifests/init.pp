# == Class: pkgbuilder
#
# Full description of class pkgbuilder here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { pkgbuilder:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class pkgbuilder (
 $install_dir = '/home/root',
 $username = 'root',
# $group = 'osqa',
 $db_rootuser = 'root',
 $db_rootpassword = 'root',
 $db_name = 'pbuild1',
 $db_username = 'pbuild1',
 $db_password = 'packit',
 $public_ip = '127.0.0.1'
 
 ){
    include pkgbuilder::db
    include pkgbuilder::source
    include pkgbuilder::pithon
    include pkgbuilder::dbuild
    include pkgbuilder::installdbuild
    include pkgbuilder::migrate
    Class['pkgbuilder::db'] ->  Class['pkgbuilder::source']  ->  Class['pkgbuilder::pithon']  ->  Class['pkgbuilder::dbuild'] ->  Class['pkgbuilder::installdbuild']  ->  Class['pkgbuilder::migrate']
}
