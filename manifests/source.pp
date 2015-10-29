class pkbuilder::source {
    exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    logoutput => on_failure,
  }
    package { "git": ensure => installed, require  => Exec['apt-get update'], }

    vcsrepo { "/home/root/pkbuilder":
    ensure => present,
    provider => git,
    source => "https://github.com/akash1808/python-overcast.django",
    revision => "master",
    user => "root",
    require => Package["git"],
    #owner => $group,
    #require => [User[‘osqa’], File[$install_dir]],
 
}

  file { "/home/root/pkbuilder/test_project/settings.py":
  ensure  => file,
  content => template('pkbuilder/settings.py.erb'),
  require => Vcsrepo['/home/root/pkbuilder'],
}
}


