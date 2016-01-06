# == Class: pkgbuilder
#
# This class aims to act as a central place for including other classes
#
# === Parameters
#
# [*install_dir*]
#   Location where pkgbuilder will get installed.
#
# [*username*]
#   user under which pkgbuilder gets installed.
# [*public_ip*]
#   public_ip or dns name where the service is deployed
# [*public_port*]
#   public_port where the server is listening
#
#   
#
# === Authors
#
# Author Name <akash.agrawal1992@gmail.com>
#
# === Copyright
#
# Copyright 2015 Akash Agrawal, unless otherwise noted.
#
class pkgbuilder (
 $install_dir = '/var/lib',
 $username    = 'pkgbuilder',
 $group       = 'www-data',
 $public_ip   = '*',
 $public_port = '9000',
 $log_dir     = '/var/log/pkgbuilder' ,
 $server_name  = 'pkgbuilder.corp.jiocloud.com',
 $proxy       = 'http://10.140.218.59:3128/'
 ){
    include pkgbuilder::createuser
    include pkgbuilder::db
    include pkgbuilder::source
    include pkgbuilder::pythonvenv
    include pkgbuilder::dockerinstall
    include pkgbuilder::dbuildinstall
    include pkgbuilder::migrate
    include pkgbuilder::scripts
    include pkgbuilder::apachevhost
}
