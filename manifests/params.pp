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
    default => 'npcd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'npcd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'nagios',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/pnp4nagios',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/pnp4nagios/npcd.conf',
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

  $pid_file = $::operatingsystem ? {
    default => '/var/run/npcd.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/pnp4nagios',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/pnp4nagios',
  }

  $ssi_file = $::operatingsystem ? {
    default => '/usr/share/nagios/html/ssi/status-header.ssi',
  }

  $ssi_dir = $::operatingystem ? {
    default => '/usr/share/nagios/html/ssi',
  }

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
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
