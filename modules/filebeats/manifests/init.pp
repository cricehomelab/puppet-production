class filebeats{
  service {'filebeat' :
    ensure => started,
  }
}
