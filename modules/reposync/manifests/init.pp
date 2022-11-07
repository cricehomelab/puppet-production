class reposync {
  cron { 'reposync' :
    command => 'sh /etc/puppetlabs/code/environments/production/puppet-reposync.sh',
    user    => 'root',
    minute  => '*/5',
  }

  file {'/etc/logrotate.sh' :
    ensure => file,
    source => 'puppet:///modules/reposync/logrotate.sh'
  }

  cron { 'logrotate' :
    command => 'sh /etc/logrotate.sh',
    user    => root,
    hour    => 23,
    minute  => 59,
  }
}
