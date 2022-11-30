class filebeats{

  #install portion
  file { '/etc/scripts/install_filebeats.sh':
    ensure => present,
    source => 'puppet:///modules/filebeats/installfilebeats.sh'
  }

  exec { '/etc/scripts/install_filebeats.sh':
    provider => shell,
    creates => '/etc/filebeats/filebeat.yml',
  }

  # state of service.
  service {'filebeat' :
    ensure => running,
  }


}
