# Class: pnp4nagios::params
#
# This class defines default parameters used by the main module class pnp4nagios
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to pnp4nagios class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class pnp4nagios::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'pnp4nagios',
  }

  $service = $::operatingsystem ? {
    default => 'pnp4nagios',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'pnp4nagios',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'pnp4nagios',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/pnp4nagios',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/pnp4nagios/pnp4nagios.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/pnp4nagios',
    default                   => '/etc/sysconfig/pnp4nagios',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/pnp4nagios.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/pnp4nagios',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/pnp4nagios',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/pnp4nagios/pnp4nagios.log',
  }

  $port = '42'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
