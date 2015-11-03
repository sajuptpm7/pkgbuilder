# == Class: pkgbuilder::db
#
# This class is used to create database for pkgbuilder along with user 
# and password. Parameters come from init.pp
# ==

class pkgbuilder::db {
    service { "mysql":
    enable => true,
    ensure => running,
  }

    mysqldb { "${pkgbuilder::db_name}":
        user => "${pkgbuilder::db_username}",
        password => "${pkgbuilder::db_password}",
    }
}


define mysqldb( $user, $password ) {
    exec { "create-${name}-db":
      unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
      command => "/usr/bin/mysql -u${pkgbuilder::db_rootuser} -p${pkgbuilder::db_rootpassword} -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
      require => Service["mysql"],
    }
  }
