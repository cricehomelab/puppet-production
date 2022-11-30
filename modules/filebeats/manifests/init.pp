class filebeats{

  service {'filebeat' :
    ensure => running,
  }


}
