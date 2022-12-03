class filebeats{

  #install portion
  file { '/etc/scripts/install_filebeats.sh':
    ensure => present,
    source => 'puppet:///modules/filebeats/installfilebeats.sh'
  }

  exec { '/etc/scripts/install_filebeats.sh':
    provider => shell,
    creates => '/etc/filebeat/filebeat.yml',
  }

  # state of service.
  service {'filebeat' :
    ensure => running,
  }

  file { '/etc/scripts/puppetlogging.py':
    ensure => present,
    source => 'puppet:///modules/filebeats/puppetlogging.py',
    owner  => 'root',

  }

  cron { 'pull_puppet_summary':
    command => 'python3 /etc/scripts/puppetlogging.py',
    user    => 'root',
    minute  => '*/29',
  }
}
