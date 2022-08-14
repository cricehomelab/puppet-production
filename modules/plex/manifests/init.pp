# installation and config for plex. 
class plex {
  # on device paths
  $plexlocation              = '/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/'
  $plexinstallscriptlocation = '/tmp/plexinstall.sh'

  #files to service to machine
  $plexinstallscript = 'puppet:///modules/plex/plexinstall.sh'

  # stage install script on server. 
  file { $plexinstallscriptlocation :
    ensure => present,
    source => $plexinstallscript,
  }
  # unattended install
  exec { 'installplex' :
    command  => 'sh /tmp/plexinstall.sh',
    provider => shell,
    creates  => $plexlocation,
    require  => File[$plexinstallscriptlocation],    
  }  
}
