class reposync {
  file { '/etc/scripts' :
    ensure => directory,
  }

  file { '/etc/scripts/puppet-reposync.sh' :
    ensure => present,
    source => 'puppet:///modules/reposync/puppet-reposync.sh',

  }
  cron { 'reposync' :
    command => 'sh /etc/scripts/puppet-reposync.sh',
    user    => 'root',
    minute  => '*/5',
  }

  file {'/etc/scripts/logrotate.sh' :
    ensure => file,
    source => 'puppet:///modules/reposync/logrotate.sh'
  }

  cron { 'logrotate' :
    command => 'sh /etc/scripts/logrotate.sh',
    user    => root,
    hour    => 23,
    minute  => 59,
  }
}
