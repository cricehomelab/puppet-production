class pihole {  
  # need to create a conf file for unattended install https://discourse.pi-hole.net/t/what-is-setupvars-conf-and-how-do-i-use-it/3533
  # execute the installer script for pihole
  # ensure the service is started. 
  $params = {
    "piholeinstallscript" => '/tmp/install-pihole.sh'
    "piholefilelocation"  => 'puppet:///modules/pihole/'
    "piholeconfigfile"    => '/etc/pihole/setupVars.conf'
  }

  file { $piholeinstallscript :
    ensure => present,
    source => $piholeinstallscriptlocation,

  }
  file { $piholeconfigfile: 
    ensure => present,
    
  }
  exec { 'sh install-pihole.sh' :
    cwd => '/tmp/',    
    requires => file[$piholeinstallscript, $piholeconfigfile],
  }
}
