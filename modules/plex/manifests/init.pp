# installation and config for plex. 
class plex {
  # on device paths
  $plexlocation              = '/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/'
  $plexinstallscriptlocation = '/tmp/plexinstall.sh'

  #files to service to machine
  $plexinstallscript = 'puppet:///modules/plex/plexinstall.sh'

  file { $plexinstallscriptlocation :
    ensure => present,
    source => $plexinstallscript,
  }

  exec { 'installplex' :
    command  => 'sh /tmp/plexinstall.sh',
    provider => shell,
    creates  => $plexlocation,
    require  => $plexinstallscriptlocation,    
  }

  service {'plexmediaserver':
    ensure => running,
  }


}
