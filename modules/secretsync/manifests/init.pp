class secretsync {
  file { '/tmp/secrets' :
    ensure => directory,
  }

  file { '/tmp/secrets/secretsync.sh' :
    ensure => file,
    source => 'puppet:///modules/secretsync/secretsync.sh',
  }

  file { '/etc/secrets/git_init.sh' :
    ensure => file,
    source => 'puppet:///modules/secretsync/git_init.sh',
  }
  exec { 'init_git' :
    command => 'sh /etc/secretes/git_init.sh',
    unless  => 'test -f /etc/pihole/setupvars.conf',
  }

  cron { 'secretsync' :
    command => 'sh /tmp/secrets/secretsync.sh',
    minute  => '*/5',
  }
}
