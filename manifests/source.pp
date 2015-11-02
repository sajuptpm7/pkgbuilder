class pkgbuilder::source {
    exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    logoutput => on_failure,
  }
    package { "git": ensure => installed, require  => Exec['apt-get update'], }

    vcsrepo { "${pkgbuilder::install_dir}/pkgbuilder":
    ensure => present,
    provider => git,
    source => "https://github.com/akash1808/python-overcast.django",
    revision => "master",
    user => "${pkgbuilder::username}",
    require => Package["git"],
    #owner => $group,
    #require => [User[‘osqa’], File[$install_dir]],
 
}

  file { "${pkgbuilder::install_dir}/pkgbuilder/test_project/settings.py":
  ensure  => file,
  content => template('pkgbuilder/settings.py.erb'),
  require => Vcsrepo["${pkgbuilder::install_dir}/pkgbuilder"],
}
}


