# == Class: pkgbuilder::apachevhost
#
# This class is used for creating apache vhost
# ==

class pkgbuilder::apachevhost {

 include ::apache

 apache::vhost { 'pkgbuilder-vhost':
 port              => 80,
 docroot           => "${pkgbuilder::install_dir}/pkgbuilder",
 servername        => "${pkgbuilder::server_name}",
 vhost_name        => "${pkgbuilder::vhost_name}",
 serveraliases     => ["${pkgbuilder::server_name}"],
 options           => ['Indexes','FollowSymLinks','MultiViews'],
 directories       => [{ path => "${pkgbuilder::install_dir}/pkgbuilder/data/public_repos/", order => 'allow,deny', allow => 'from all',options => ['Indexes','FollowSymLinks','MultiViews'] },{ path => "${pkgbuilder::install_dir}/pkgbuilder/mirrors/snapshots/", order => 'allow,deny', allow => 'from all',options => ['Indexes','FollowSymLinks','MultiViews'] }],
 aliases           => [{ alias => '/apt/', path => "${pkgbuilder::install_dir}/pkgbuilder/data/public_repos/" },{ alias => '/snapshots/', path => "${pkgbuilder::install_dir}/pkgbuilder/mirrors/snapshots/" }],
 }
}


