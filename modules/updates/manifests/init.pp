class updates {
  $restart_group_1 = 'janus-main', 'dionysus-main'
  $restart_group_2 = 'iana-main', 
  $dns_group = 'iana-main', 'janus-main'  
  if $::facts['hostname'] in $dns_group {
    schedule { 'pihole_update' :
      period => weekly,
      range  => "23:00 - 1:00",
      repeat => 1,
    }
  }
  if $::facts['hostname'] in $restart_group_1 {
    schedule { 'group1updates' :
      period => weekly,
      range  => "3:00 - 5:00",
      repeat => 1,
    }
  }
  elsif $::facts['hostname'] in $restart_group_2 {
    schedule { "group2updates" :
      period => weekly, 
      range  => "1:00 - 3:00",
      repeat => 1,
    }
  }
  # update pihole regularly. 
  exec {'pihole -up' :
    schedule => [pihole_update],
    provider => shell,
  }    
  # weekly command to run updates. 
  exec {'apt-get update && apt-get upgrade' :
    schedule => ['group1updates', 'group2updates'],
    provider => shell,
  }
  # reboot after updates go through.
  reboot {'after' :
    subscribe => Exec['apt-get update && apt-get upgrade'],
  }
}
