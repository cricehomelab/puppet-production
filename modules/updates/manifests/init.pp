class updates {
  file { '/home/charlie/updates.sh' :
    ensure => present,
    source => 'puppet:///modules/updates/updates.sh',
  }
  cron { 'weekly_updates' :
    command => 'sh /home/charlie/updates.sh',
    weekday => 'Monday',
    hour    => ['2-4'],
  }
}
