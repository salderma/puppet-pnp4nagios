# = Class: pnp4nagios
#
# This is the main pnp4nagios class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, pnp4nagios class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $pnp4nagios_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, pnp4nagios main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $pnp4nagios_source
#
# [*source_dir*]
#   If defined, the whole pnp4nagios configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $pnp4nagios_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $pnp4nagios_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, pnp4nagios main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $pnp4nagios_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $pnp4nagios_options
#
# [*service_autorestart*]
#   Automatically restarts the pnp4nagios service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $pnp4nagios_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $pnp4nagios_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $pnp4nagios_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $pnp4nagios_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for pnp4nagios checks
#   Can be defined also by the (top scope) variables $pnp4nagios_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $pnp4nagios_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $pnp4nagios_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $pnp4nagios_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $pnp4nagios_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for pnp4nagios port(s)
#   Can be defined also by the (top scope) variables $pnp4nagios_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling pnp4nagios. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $pnp4nagios_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $pnp4nagios_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $pnp4nagios_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $pnp4nagios_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in pnp4nagios::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of pnp4nagios package
#
# [*service*]
#   The name of pnp4nagios service
#
# [*service_status*]
#   If the pnp4nagios service init script supports status argument
#
# [*process*]
#   The name of pnp4nagios process
#
# [*process_args*]
#   The name of pnp4nagios arguments. Used by puppi and monitor.
#   Used only in case the pnp4nagios process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user pnp4nagios runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $pnp4nagios_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $pnp4nagios_protocol
#
#
# See README for usage patterns.
#
class pnp4nagios (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  ) inherits pnp4nagios::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $pnp4nagios::bool_absent ? {
    true  => 'absent',
    false => $pnp4nagios::version,
  }

  $manage_service_enable = $pnp4nagios::bool_disableboot ? {
    true    => false,
    default => $pnp4nagios::bool_disable ? {
      true    => false,
      default => $pnp4nagios::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $pnp4nagios::bool_disable ? {
    true    => 'stopped',
    default =>  $pnp4nagios::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $pnp4nagios::bool_service_autorestart ? {
    true    => Service[pnp4nagios],
    false   => undef,
  }

  $manage_file = $pnp4nagios::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $pnp4nagios::bool_absent == true
  or $pnp4nagios::bool_disable == true
  or $pnp4nagios::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $pnp4nagios::bool_absent == true
  or $pnp4nagios::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $pnp4nagios::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $pnp4nagios::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $pnp4nagios::source ? {
    ''        => undef,
    default   => $pnp4nagios::source,
  }

  $manage_file_content = $pnp4nagios::template ? {
    ''        => undef,
    default   => template($pnp4nagios::template),
  }

  ### Managed resources
  package { $pnp4nagios::package:
    ensure  => $pnp4nagios::manage_package,
    noop    => $pnp4nagios::bool_noops,
  }

  service { 'pnp4nagios':
    ensure     => $pnp4nagios::manage_service_ensure,
    name       => $pnp4nagios::service,
    enable     => $pnp4nagios::manage_service_enable,
    hasstatus  => $pnp4nagios::service_status,
    pattern    => $pnp4nagios::process,
    require    => Package[$pnp4nagios::package],
    noop       => $pnp4nagios::bool_noops,
  }

  file { 'pnp4nagios.conf':
    ensure  => $pnp4nagios::manage_file,
    path    => $pnp4nagios::config_file,
    mode    => $pnp4nagios::config_file_mode,
    owner   => $pnp4nagios::config_file_owner,
    group   => $pnp4nagios::config_file_group,
    require => Package[$pnp4nagios::package],
    notify  => $pnp4nagios::manage_service_autorestart,
    source  => $pnp4nagios::manage_file_source,
    content => $pnp4nagios::manage_file_content,
    replace => $pnp4nagios::manage_file_replace,
    audit   => $pnp4nagios::manage_audit,
    noop    => $pnp4nagios::bool_noops,
  }

  # The whole pnp4nagios configuration directory can be recursively overriden
  if $pnp4nagios::source_dir {
    file { 'pnp4nagios.dir':
      ensure  => directory,
      path    => $pnp4nagios::config_dir,
      require => Package[$pnp4nagios::package],
      notify  => $pnp4nagios::manage_service_autorestart,
      source  => $pnp4nagios::source_dir,
      recurse => true,
      purge   => $pnp4nagios::bool_source_dir_purge,
      force   => $pnp4nagios::bool_source_dir_purge,
      replace => $pnp4nagios::manage_file_replace,
      audit   => $pnp4nagios::manage_audit,
      noop    => $pnp4nagios::bool_noops,
    }
  }


  ### Include custom class if $my_class is set
  if $pnp4nagios::my_class {
    include $pnp4nagios::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $pnp4nagios::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'pnp4nagios':
      ensure    => $pnp4nagios::manage_file,
      variables => $classvars,
      helper    => $pnp4nagios::puppi_helper,
      noop      => $pnp4nagios::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  ###  -- Removed Port Monitoring, npcd does not open a listen port
    if $pnp4nagios::service != '' {
      monitor::process { 'pnp4nagios_process':
        process  => $pnp4nagios::process,
        service  => $pnp4nagios::service,
        pidfile  => $pnp4nagios::pid_file,
        user     => $pnp4nagios::process_user,
        argument => $pnp4nagios::process_args,
        tool     => $pnp4nagios::monitor_tool,
        enable   => $pnp4nagios::manage_monitor,
        noop     => $pnp4nagios::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  ###   -- Removed, npcd does not open a listen port

  ### Debugging, if enabled ( debug => true )
  if $pnp4nagios::bool_debug == true {
    file { 'debug_pnp4nagios':
      ensure  => $pnp4nagios::manage_file,
      path    => "${settings::vardir}/debug-pnp4nagios",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $pnp4nagios::bool_noops,
    }
  }

}
