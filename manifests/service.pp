# Class: jetty::service
#
# This class enables and starts up Jetty's service.
#
class jetty::service inherits jetty {

  service { 'Jetty':
    ensure     => running,
    name       => 'jetty',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
