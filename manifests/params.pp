class yum_manager::params {

  $yumconfig = '/etc/yum.conf'
  $cachedir = '/var/cache/yum'
  $keepcache = '0'
  $debuglevel = '2'
  $logfile = '/var/log/yum.log'
  $distroverpkg = 'redhat-release'
  $tolerant = '1'
  $exactarch = '1'
  $obsoletes = '1'
  $gpgcheck = '1'
  $plugins = '1'
  $metadata_expire = '1h'
  $reposdir = '/etc/yum.repos.d'
  $proxy = undef
  $proxy_username = undef
  $proxy_password = undef

}
