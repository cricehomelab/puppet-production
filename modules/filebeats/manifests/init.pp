class filebeats{

  #install script present on device
  file { '/etc/scripts/install_filebeats.sh':
    ensure => present,
    source => 'puppet:///modules/filebeats/installfilebeats.sh'
  }

  # execute install script
  #exec { '/etc/scripts/install_filebeats.sh':
  #  provider => shell,
  #  creates => '/etc/filebeat/filebeat.yml',
  #}

  # move logstash.yml to correct place.
  file { '/etc/filebeat/modules.d/logstash.yml':
    ensure => present,
    source => 'puppet:///modules/filebeats/logstash.yml',
  }

  # state of service.
  service {'filebeat' :
    ensure => running,
  }

  # script to make puppet logging make more sense.
  file { '/etc/scripts/puppetlogging.py':
    ensure => present,
    source => 'puppet:///modules/filebeats/puppetlogging.py',
    owner  => 'root',
  }

  # cron job to run this script every 29 minutes. Just under the run time for puppet. 
  cron { 'pull_puppet_summary':
    command => 'python3 /etc/scripts/puppetlogging.py',
    user    => 'root',
    minute  => '*/29',
  }
}
