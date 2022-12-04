class secretsync {
  file { '/tmp/secrets/' :
    ensure => directory,
  }

  file { '/tmp/secrets/secretsync.sh' :
    ensure => file,
    source => 'puppet:///modules/secretsync/secretsync.sh',
  }

  file { '/tmp/secrets/git_init.sh' :
    ensure => file,
    source => 'puppet:///modules/secretsync/git_init.sh',
  }

  cron { 'secretsync' :
    ensure  => absent,
    command => 'sh /tmp/secrets/secretsync.sh',
    minute  => '*/5',
  }
}
