# == Class: pkgbuilder::source
#
# This class is used for getting the source code of pkgbuilder and installing it
# ==
# [*sourcerepo*]
#   source repo for pkgbuilder code

class pkgbuilder::source (
 $sourcerepo      = 'https://github.com/sajuptpm7/package-builder',
 $db_rootuser     = $pkgbuilder::db::db_rootuser,
 $db_rootpassword = $pkgbuilder::db::db_rootpassword,
 $db_name         = $pkgbuilder::db::db_name,
 $db_username     = $pkgbuilder::db::db_username,
 $db_password     = $pkgbuilder::db::db_password,
){

  package { 'git':
    ensure => present,
  }

  package { 'reprepro':
    ensure => present,
  }

  file { "${pkgbuilder::install_dir}/pkgbuilder":
    ensure        => 'directory',
    owner         =>  "${pkgbuilder::username}",
    group         =>  "${pkgbuilder::group}",
    mode          => '0774',
    require       => Vcsrepo["${pkgbuilder::install_dir}/pkgbuilder"],
    before        => Class["pkgbuilder::pythonvenv"],
  }
  vcsrepo { "${pkgbuilder::install_dir}/pkgbuilder":
    ensure        => 'latest',
    provider      => git,
    source        => "${sourcerepo}",
    revision      => "exp1",
    require       => [Package["git"],Package["reprepro"],Class["pkgbuilder::createuser"],Class["pkgbuilder::db"]],
    loglevel      => debug,
 
  }	

  file { "${pkgbuilder::install_dir}/pkgbuilder/test_project/settings_local.py":
    ensure        => file,
    content       => template('pkgbuilder/settings_local.py.erb'),
    require       => Vcsrepo["${pkgbuilder::install_dir}/pkgbuilder"],
  }

}


