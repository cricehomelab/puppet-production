class secretsync {
  file { '/tmp/secrets' :
    ensure => directory,  
  }

  file { '/tmp/secrets/secretsync.sh' :
    ensure   => file,
    contents => 'puppet:///modules/secretsync/secretsync.sh',
  }

  cron { 'secretsync' :
    command => 'sh /tmp/secrets/secretsync.sh',
    minute  => '*/5',
  }

}
