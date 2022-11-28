class pihole {  
  # REMOVE ROW OF COMMENTS TO INSTALL PIHOLE. 
  # need to create a conf file for unattended install https://discourse.pi-hole.net/t/what-is-setupvars-conf-and-how-do-i-use-it/3533
  # execute the installer script for pihole
  # ensure the service is started. 

  # file paths on my pihole i am using. 
  $piholeinstallscript         = '/tmp/install-pihole.sh'
  $piholedirectory             = '/etc/pihole/'
  $piholeconfigfile            = '/etc/pihole/setupVars.conf'
  $piholednsrecords            = '/etc/pihole/custom.list'
  $piholednsmasq               = '/etc/dnsmasq.d/99-edns.conf'
 
  # Puppet file locations for pushing files down to pihole
  $piholeinstallscriptlocation = 'puppet:///modules/pihole/install-pihole.sh'
  $piholednsrecordlocation     = 'puppet:///modules/pihole/custom.list' 

  #TODO stop using template going to clone this down from another source. 

  # script to run the installer.
  file { $piholeinstallscript :
    ensure => present,
    source => $piholeinstallscriptlocation,
  }

  # Create /etc/pihole/ directory.
  file { $piholedirectory :
    ensure => directory,
  }

  # Execution of the install script.
  exec { 'install-command' :
    command  => 'sh /tmp/install-pihole.sh',
    provider => shell,
    creates  => '/usr/local/bin/pihole',
  }

  file { $piholednsrecords :
    ensure => present,
    source => $piholednsrecordlocation,  
  }

  cron { 'pihole_update' :
     command => 'pihole -up',
     weekday => 'Tuesday',
     hour    => 2,
     minute  => 0,
  }
}
