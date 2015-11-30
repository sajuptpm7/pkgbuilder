# == Class: pkgbuilder::dockerinstall
#
# This class is used for installation of docker using puppet module docker
# ==


class pkgbuilder::dockerinstall {
class { 'docker':
  manage_kernel => false,
  docker_users  => [pkgbuilder],
  proxy => $rjil::system::apt::proxy,
  extra_parameters => ['--bip=192.168.1.1/24'],
      }
}
