# == Class: pkgbuilder::dbuildinstall
#
# This class is used for installation of dbuild library
# ==


class pkgbuilder::dbuildinstall {
exec { 'Install python-dbuild':
 cwd => "${pkgbuilder::install_dir}/pkgbuilder",
 provider => shell,
 user => "${pkgbuilder::username}",
 command => ". venv/bin/activate && pip install -e 'git+https://github.com/hkumarmk/python-dbuild@master#egg=Package'",
 refreshonly => false,
 }

}
