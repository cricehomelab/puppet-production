class logging {
  file { '/etc/scripts/elk_server_install.sh' :
    ensure => present,
    content => 'puppet:///modules/logging/elkserverinstall.sh',
  }

  exec { 'sh /etc/scripts/elk_server_install.sh' :
    provider => shell,
    unless => 'test -f /home/charlie/elastisearchinfo.txt'
  }
}
