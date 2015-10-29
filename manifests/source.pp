class pkbuilder::source {
    exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    logoutput => on_failure,
  }
    package { "git": ensure => installed, require  => Exec['apt-get update'], }

    vcsrepo { "${pkbuilder::install_dir}/pkbuilder":
    ensure => present,
    provider => git,
    source => "https://github.com/akash1808/python-overcast.django",
    revision => "master",
    user => "${pkbuilder::username}",
    require => Package["git"],
    #owner => $group,
    #require => [User[‘osqa’], File[$install_dir]],
 
}

  file { "${pkbuilder::install_dir}/pkbuilder/test_project/settings.py":
  ensure  => file,
  content => template('pkbuilder/settings.py.erb'),
  require => Vcsrepo["${pkbuilder::install_dir}/pkbuilder"],
}
}


