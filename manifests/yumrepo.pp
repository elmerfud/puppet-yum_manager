define yum_manager::yumrepo (
  $enabled,
  $baseurl,
  $descr,
  $includepkgs='absent',
  $gpgcheck='1',
  $gpgkey='absent',
  $priority='99',
  $proxy='absent',
  $proxy_password='absent',
  $proxy_username='absent',
  $protect='absent' ) {

  $filename = $title

  yumrepo {
    $filename:
      descr => $descr,
      enabled => $enabled,
      baseurl => $baseurl,
      gpgcheck => $gpgcheck,
      gpgkey => $gpgkey,
      priority => $priority,
      proxy => $proxy,
      proxy_username => $proxy_username,
      proxy_password => $proxy_password,
      protect => $protect
  }

  file {
    "/etc/yum.repos.d/${filename}.repo":
      ensure => present,
      require => Yumrepo[$title];
  }
}
