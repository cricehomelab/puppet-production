class secretsync {
  file { '/tmp/secrets' :
    ensure => directory,  
  }

  file { '/tmp/secrets/secretsync.sh' :
    ensure   => file,
    source   => 'puppet:///modules/secretsync/secretsync.sh',
    owner    => 'root',
    mode     => '0600',
  }

  cron { 'secretsync' :
    command => 'sh /tmp/secrets/secretsync.sh',
    minute  => '*/5',
  }

}
