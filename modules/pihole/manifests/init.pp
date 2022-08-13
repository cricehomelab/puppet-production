class pihole {  
  # need to create a conf file for unattended install https://discourse.pi-hole.net/t/what-is-setupvars-conf-and-how-do-i-use-it/3533
  # execute the installer script for pihole
  # ensure the service is started. 
  
  # file paths on my pihole i am using. 
  $piholeinstallscript         = '/tmp/install-pihole.sh'
  $piholedirectory             = '/etc/pihole/'   
  $piholeconfigfile            = '/etc/pihole/setupVars.conf'  
  $piholednsrecords            = '/etc/pihole/custom.list'

  # Puppet file locations for pushing files down to pihole
  $piholeinstallscriptlocation = 'puppet:///modules/pihole/install-pihole.sh'
  $piholednsrecordlocation     = 'puppet:///modules/pihole/custom.list'

  # rendering template for config file
  # note this seems to get changed when I attempt to set the password on installation. 
  # I was able to get the password reset from ssh to the pihole.
  # kind of a bummer but not a big deal. 
  $params = {'password' => $::facts[pihole]}
  $output = epp('pihole/setupVars.conf.epp', $params)

  # script to run the installer. 
  file { $piholeinstallscript :
    ensure => present,
    source => $piholeinstallscriptlocation,
  }

  # Create /etc/pihole/ directory.
  file { $piholedirectory :
    ensure => directory,
  }

  # Copy down config file. need to make this part better. 
  file { $piholeconfigfile : 
    ensure   => present,
    # content  => $output,  # uncomment for reinstall
    require  => File[$piholedirectory],
  }

  # Execution of the install script. 
  exec { 'install-command' :    
    command  => 'sh /tmp/install-pihole.sh',
    provider => shell, 
    creates  => '/usr/local/bin/pihole',   
    require  => File[$piholeinstallscript, $piholeconfigfile],
  }
  file { $piholednsrecords :
    ensure => present,
    source => $piholednsrecordlocation,
    require => Exec['install-command'],
  } 
}
