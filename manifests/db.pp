class pkbuilder::db {
    service { "mysql":
    enable => true,
    ensure => running,
#    require => Package["mysql-server"],
  }

    mysqldb { "${pkbuilder::db_name}":
        user => "${pkbuilder::db_username}",
        password => "${pkbuilder::db_password}",
    }
}


define mysqldb( $user, $password ) {
    exec { "create-${name}-db":
      unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
      command => "/usr/bin/mysql -u${pkbuilder::db_rootuser} -p${pkbuilder::db_rootpassword} -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
      require => Service["mysql"],
    }
  }
