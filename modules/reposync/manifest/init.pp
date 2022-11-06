class reposync {
  cron { 'reposync':
    command => 'sh /etc/puppetlabs/code/environments/production/puppet-reposync.sh',
    user    => 'root',
    minute  => /5,
  }
}
