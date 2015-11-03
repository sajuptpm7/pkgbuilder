# == Class: pkgbuilder::db
#
# This class is used for installation of docker using puppet module docker
# ==


class pkgbuilder::dockerinstall {
class { 'docker':
  manage_kernel => false,
	}

}
