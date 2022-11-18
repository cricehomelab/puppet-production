class logging {
  # Ensure Presence of script to install InfluxDB
  file { '/etc/scripts/installinflux.sh' : 
    ensure => present,
    source => 'puppet:///module/logging/installinflux.sh',
  }

  # script to install influx db
  exec { 'install_influx' :
    command  => 'sh /etc/scripts/installinflux.sh',
    provider =>  shell,
    unless   => 'test -f /etc/influxdb/influxdb.conf',
  }

}
