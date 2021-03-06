# == Class: redis
#
# Full description of class redis here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { redis:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class redis(
  $default_instance = $redis::params::default_instance,
  $dir_conf         = $redis::params::dir_conf,
  $dir_lib          = $redis::params::dir_lib,
  $dir_log          = $redis::params::dir_log,
  $dir_run          = $redis::params::dir_run,
  $file_conf        = $redis::params::file_conf,
  $file_init        = $redis::params::file_init,
  $user             = $redis::params::user,
  $version          = $redis::params::version
) inherits redis::params {
  class{'redis::install': } ->
  class{'redis::config': } ~>
  class{'redis::service': } ->
  Class['redis']
}

# vim: set ts=2 sw=2 et ft=puppet:
