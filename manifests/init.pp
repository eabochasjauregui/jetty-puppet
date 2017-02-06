# Class: jetty
#
# This class installs Jetty.
#
class jetty (

  $root		= '/opt',
  $tar		= 'puppet:///modules/jetty/jetty-distribution-9.4.1.v20170120.tar.gz',

  $user		= 'jetty',
  $group	= 'jetty',

  $port		= '8080',
  $base

) {

  File {
    owner => $user,
    group => $group,
  }

  contain jetty::install
  contain jetty::config
  contain jetty::service

  Class['::jetty::install']
  -> Class['::jetty::config']
  ~> Class['::jetty::service']

}
