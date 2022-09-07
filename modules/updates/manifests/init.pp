class updates {
  $restart_group_1 = 'janus-main', 'dionysus-main'
  $restart_group_2 = 'iana-main', 
  if $::facts['hostname'] in $restart_group_1 {
    schedule { 'group1updates' :
      period => weekly,
      range  => "3-5",
      repeat => 1,
    }
  }
  elsif $::facts['hostname'] in $restart_group_2 {
    schedule { "group2updates" :
      period => weekly, 
      range  => "1-3",
      repeat => 1,
    }
  } 
  exec {'apt-get update && apt-get upgrade' :
    schedule => ['group1updates', 'group2updates'],
    provider => shell,
  }
  reboot {'after' :
    subscribe exec ['apt-get update && apt-get upgrade'],
  }


}
