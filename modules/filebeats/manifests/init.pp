class filebeats{
  qservice {'filebeat' :
    ensure => started,
  }
}
