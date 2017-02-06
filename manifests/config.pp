# Class: jetty::config
#
# This class sets up Jetty's configuration and process ID files.
#
class jetty::config inherits jetty {

  file { '/etc/init.d/jetty':
    ensure => link,
    target => "${root}/jetty/bin/jetty.sh",
  }

  file { '/usr/lib/tmpfiles.d/jetty.conf':
    ensure  => file,
    content => template('jetty/tmpfiles.erb'),
    owner   => 'root',
    group   => 'root',
  }

  file { '/var/run/jetty':
    ensure => directory,
  }

  file { '/var/run/jetty/jetty.pid':
    ensure => file,
  }

  file { '/etc/default/jetty':
    ensure  => file,
    content => template('jetty/defaults.erb'),
  }

}
