# Puppet module: pnp4nagios

This is a Puppet module for pnp4nagios based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Sean Alderman / University of Dayton

Official site: http://www.udayton.edu

Official git repository: http://github.com/salderma/puppet-pnp4nagios

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.

This module is currently structured for RHEL based Linux servers which have EPEL repository deployed.

## USAGE - Basic management

* Install pnp4nagios with default settings

        class { 'pnp4nagios': }

* Install a specific version of pnp4nagios package

        class { 'pnp4nagios':
          version => '1.0.1',
        }

* Disable pnp4nagios service.

        class { 'pnp4nagios':
          disable => true
        }

* Remove pnp4nagios package

        class { 'pnp4nagios':
          absent => true
        }

* Enable auditing without without making changes on existing pnp4nagios configuration *files*

        class { 'pnp4nagios':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'pnp4nagios':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'pnp4nagios':
          source => [ "puppet:///modules/example42/pnp4nagios/pnp4nagios.conf-${hostname}" , "puppet:///modules/example42/pnp4nagios/pnp4nagios.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'pnp4nagios':
          source_dir       => 'puppet:///modules/example42/pnp4nagios/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'pnp4nagios':
          template => 'example42/pnp4nagios/pnp4nagios.conf.erb',
        }

* Automatically include a custom subclass

        class { 'pnp4nagios':
          my_class => 'example42::my_pnp4nagios',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'pnp4nagios':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'pnp4nagios':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'pnp4nagios':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'pnp4nagios':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/salderma/puppet-pnp4nagios.png?branch=master" alt="Build Status" />}[https://travis-ci.org/salderma/puppet-pnp4nagios]
