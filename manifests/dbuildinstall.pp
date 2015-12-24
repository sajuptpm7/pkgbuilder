# == Class: pkgbuilder::dbuildinstall
#
# This class is used for installation of dbuild library
# ==
# [*dbuildsource*]
#   source repo for python dbuild

class pkgbuilder::dbuildinstall (
 $dbuildsource  = 'https://github.com/aaSemble/python-dbuild'

 ){

  file { "${pkgbuilder::install_dir}/python-dbuild":
    ensure        => 'directory',
    owner         =>  "${pkgbuilder::username}",
    group         =>  "${pkgbuilder::group}",
    mode          => '0774',
    require       => Vcsrepo["${pkgbuilder::install_dir}/python-dbuild"],

  }
  vcsrepo { "${pkgbuilder::install_dir}/python-dbuild":
    ensure        => 'latest',
    provider      => git,
    source        => "${dbuildsource}",
    revision      => "master",

  }
  file { "${pkgbuilder::install_dir}/pkgbuilder/venv/local/lib/python2.7/site-packages/dbuild/templates/dockerfile.jinja":
  ensure       => file,
  content      => template('pkgbuilder/dockerfile.jinja.erb'),
  mode         => 744,
  require      => [Vcsrepo["${pkgbuilder::install_dir}/python-dbuild"],File["${pkgbuilder::install_dir}/python-dbuild"],Exec["Install python-dbuild"]],
        }
 exec { 'Install python-dbuild':
   cwd         => "${pkgbuilder::install_dir}/pkgbuilder",
   provider    => shell,
   user        => "${pkgbuilder::username}",
   command     => ". venv/bin/activate && pip install  '${pkgbuilder::install_dir}/python-dbuild'",
   refreshonly => false,
   require     => [Class["pkgbuilder::dockerinstall"],Class["pkgbuilder::pythonvenv"],Vcsrepo["${pkgbuilder::install_dir}/python-dbuild"]],
 }

}
