# == Class: pkgbuilder::db
#
# This class is used for getting the source code of pkgbuilder and installing it
# ==

class pkgbuilder::source {
    exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    logoutput => on_failure,
  }
    package { "git": ensure => installed, require  => Exec['apt-get update'], }
    
    package { "reprepro": ensure => installed, }

    vcsrepo { "${pkgbuilder::install_dir}/pkgbuilder":
    ensure => present,
    provider => git,
    source => "${pkgbuilder::sourcerepo}",
    revision => "master",
    user => "${pkgbuilder::username}",
    require => [Package["git"],Package["reprepro"],Class["pkgbuilder::db"]],
 
	}	

  file { "${pkgbuilder::install_dir}/pkgbuilder/test_project/settings.py":
  ensure  => file,
  content => template('pkgbuilder/settings.py.erb'),
  require => Vcsrepo["${pkgbuilder::install_dir}/pkgbuilder"],
	}
}


