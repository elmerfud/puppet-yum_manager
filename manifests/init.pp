class yum_manager (
  $yumconfig = $yum_manager::params::yumconfig,
  $cachedir = $yum_manager::params::cachedir,
  $keepcache = $yum_manager::params::keepcache,
  $debuglevel = $yum_manager::params::debuglevel,
  $logfile = $yum_manager::params::logfile,
  $distroverpkg = $yum_manager::params::distroverpkg,
  $tolerant = $yum_manager::params::tolerant,
  $exactarch = $yum_manager::params::exactarch,
  $obsoletes = $yum_manager::params::obsoletes,
  $gpgcheck = $yum_manager::params::gpgcheck,
  $plugins = $yum_manager::params::plugins,
  $metadata_expire = $yum_manager::params::metadata_expire,
  $reposdir = $yum_manager::params::reposdir,
  $proxy = $yum_manager::params::proxy,
  $proxy_username = $yum_manager::params::proxy_username,
  $proxy_password = $yum_manager::params::proxy_password
) inherits yum_manager::params {

  case $::operatingsystem {
    centos,fedora,rhel,redhat: {
      file {
        "${yumconfig}":
          ensure  => file,
          owner   => 'root',
          group   => 'root',
          mode    => 644,
          content => template('yum_manager/yumconf.erb');
        "${cachedir}":
          ensure => directory,
          owner  => 'root',
          group  => 'root',
          mode   => 755;
        "${reposdir}":
          ensure => directory,
          owner  => 'root',
          group  => 'root',
          mode   => 755;
      }

    }
    default: {
      fail("Unsupported ${::operatingsystem}")
    }
  }
}

