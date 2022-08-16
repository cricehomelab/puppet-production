class jellyfin {  
  $prerequisiteinstall = '/tmp/installrequirements.sh'  
   
  # first requirement
  package { 'apt-transport-https':
    ensure => installed,
  }
  # staging install script
  file { $prerequisiteinstall :
    ensure => present,
    source => 'puppet:///jellyfin/modules/jellyfin/installrequirements.sh',
    require => Package['apt-transport-https'],
  }
  # running the install script
  exec { 'install-prerequisite-command':
    command  => 'sh /tmp/installrequirements.sh',
    provider => shell,
    creates  => '/etc/apt/sources.list.d/jellyfin.list',
    require  => File[$prerequisiteinstall],
  }
  # running the jellyfin install
  package { 'jellyfin-install':
    name    => 'jellyfin',
    ensure  => installed,    
    require => Exec['install-prerequisite-command'],
  }
  # ensuring the service stays started once installed. 
  service { 'jellyfin': 
    ensure => running,
    require => Package['jellyfin-install'],
  }
  
}
  
