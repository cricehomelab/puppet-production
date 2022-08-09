class pihole {  
  # need to create a conf file for unattended install https://discourse.pi-hole.net/t/what-is-setupvars-conf-and-how-do-i-use-it/3533
  # execute the installer script for pihole
  # ensure the service is started. 
  
  $piholeinstallscript => '/tmp/install-pihole.sh'
  $piholedirectory     => '/etc/pihole/'   
  $piholeconfigfile    => '/etc/pihole/setupVars.conf'

  #rendering template for config file
  $params = {'password' => $::facts[pihole]}
  $output = epp{'pihole/setupVars.conf.epp', $params}


  # Install script to exectute from the tmp folder.
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
    content  => $output
    requires => file[$piholedirectory]
  }
  # Execution of the install script. 
  exec { 'sh install-pihole.sh' :
    cwd => '/tmp/',    
    requires => file[$piholeinstallscript, $piholeconfigfile],
  }
  
}
