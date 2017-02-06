# Class: jetty::install
#
# This class unpacks Jetty and its demo base.
#
class jetty::install inherits jetty {

  group { $group:
    ensure => present,
  } ->
  user { $user:
    ensure => present,
    shell  => '/bin/false',
    gid    => $group,
  } ->
  file { "${root}/jetty.tar.gz":
    ensure => file,
    source => $tar,
  } ->
  file { "${root}/jetty":
    ensure => directory,
  } ->
  archive { "${root}/jetty.tar.gz":
    extract         => true,
    extract_command => 'tar xf %s --strip-components=1',
    extract_path    => "${root}/jetty",
    cleanup         => true,
    creates         => "${root}/jetty/bin/jetty.sh",
    user            => $user,
    group           => $group,
  } ->
  file { '/var/jetty/':
    ensure => directory,
  } ->
  file { '/var/jetty/demo':
    ensure  => directory,
    recurse => true,
    source  => "file://${root}/jetty/demo-base",
  }

}
