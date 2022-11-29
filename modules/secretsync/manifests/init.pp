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

  exec { 'sh /tmp/secrets/git_init.sh' :
    provider => shell,
    unless   => 'test -f /etc/pihole/setupvars.conf',
  }

  cron { 'secretsync' :
    command => 'sh /tmp/secrets/secretsync.sh',
    minute  => '*/5',
  }
}
