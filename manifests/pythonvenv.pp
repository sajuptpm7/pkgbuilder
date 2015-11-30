
# == Class: pkgbuilder::migrate
#
# This class is used to for running migrations
# ==

class pkgbuilder::pythonvenv {

 exec { 'checking requests version':
   cwd         => "/root",
   provider    => shell,
   user        => "root",
   command     => "pip install requests==2.5.3",
   refreshonly => false,
   require     => [Class["pkgbuilder::db"],Class["pkgbuilder::source"]],
 }


 exec { 'create venv':
   cwd         => "${pkgbuilder::install_dir}/pkgbuilder",
   provider    => shell,
   user        => "${pkgbuilder::username}",
   command     => "virtualenv venv",
   refreshonly => false,
   creates     => "${pkgbuilder::install_dir}/pkgbuilder/venv",
   require     => [Class["pkgbuilder::db"],Class["pkgbuilder::source"],Exec["checking requests version"]],
 }
 exec { 'install requirements':
   cwd         => "${pkgbuilder::install_dir}/pkgbuilder",
   provider    => shell,
   user        => "${pkgbuilder::username}",
   command     => ". venv/bin/activate && pip install -r requirements.txt",
   refreshonly => false,
   require     => Exec["create venv"],
 }

}
