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
#
# [*db_rootuser*]
#   root user for database which pkgbuilder uses
#
# [*db_rootpassword*]
#   root password for database which pkgbuilder uses
#
# [*db_username*]
#   username with which code will connect to database
#
# [*db_password*]
#   password with which code will connect to database
#
# [*public_ip*]
#   public_ip or dns name where the service is deployed
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
 $install_dir = '/usr/share',
 $username = 'root',
 $db_rootuser = 'root',
 $db_rootpassword = 'root',
 $db_name = 'pkgbuilder',
 $db_username = 'pkgbuilder',
 $db_password = 'change3M3',
 $public_ip = '127.0.0.1'
 
 ){
    include pkgbuilder::db
    include pkgbuilder::source
    include pkgbuilder::pythoninstall
    include pkgbuilder::dockerinstall
    include pkgbuilder::dbuildinstall
    include pkgbuilder::migrate
}
