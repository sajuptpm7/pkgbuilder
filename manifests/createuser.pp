# == Class: pkgbuilder::createuser
#
# This class is used for installation of docker using puppet module docker
# ==


class pkgbuilder::createuser {
  

  user { "${pkgbuilder::username}":
   ensure     => present,
   gid        => "${pkgbuilder::group}",
   managehome => true,
   require    => Group["${pkgbuilder::group}"],
   }
}



