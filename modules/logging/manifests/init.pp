class logging {
  #file { '/etc/scripts/elk_server_install.sh' :
  #  ensure => present,
  #  source => 'puppet:///modules/logging/elkserverinstall.sh',
  #}
#
  #exec { 'sh /etc/scripts/elk_server_install.sh' :
  #  provider => shell,
  #  unless => 'test -f /home/charlie/elastisearchinfo.txt'
  #}

  service { 'elasticsearch':
    ensure => running,
  }

  service { 'kibana' :
    ensure => running,
  }
}
