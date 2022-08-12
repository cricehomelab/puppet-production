class pihole {  
  # need to create a conf file for unattended install https://discourse.pi-hole.net/t/what-is-setupvars-conf-and-how-do-i-use-it/3533
  # execute the installer script for pihole
  # ensure the service is started. 
  
  $piholeinstallscript         = '/tmp/install-pihole.sh'
  $piholedirectory             = '/etc/pihole/'   
  $piholeconfigfile            = '/etc/pihole/setupVars.conf'
  $piholeinstallscriptlocation = 'puppet:///modules/pihole/install-pihole.sh'

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

  # Copy down config file. 
  file { $piholeconfigfile: 
    ensure   => present,
    content  => $output,   #uncomment for reinstalls. 
    require  => File[$piholedirectory],
  }

  # Execution of the install script. 
  exec { 'install-command' :    
    command  => 'sh /tmp/install-pihole.sh',
    provider => shell, 
    creates  => '/usr/local/bin/pihole',   
    require  => File[$piholeinstallscript, $piholeconfigfile],
  }
  
  
}
