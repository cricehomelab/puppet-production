class updates {
  file { '/etc/scripts' :
    ensure => directory,
  }

  file { '/etc/needrestart/needrestart.conf' :
    ensure => file,
    source => 'puppet:///modules/updates/needrestart.conf',
  }

  file { '/tmp/logs' :
    ensure => directory,
  }

  file { '/etc/scripts/updates.sh' :
    ensure => present,
    source => 'puppet:///modules/updates/updates.sh',
  }

  cron { 'weekly_updates' :
    command => 'sh /etc/scripts/updates.sh',
    weekday => 'Monday',
    hour    => ['2'],
  }
}
