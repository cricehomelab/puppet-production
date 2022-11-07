class updates {
  file { '/etc/scripts' :
    ensure => directory,
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
    hour    => ['2-4'],
  }
}
