class pihole {  
  # need to create a conf file for unattended install https://discourse.pi-hole.net/t/what-is-setupvars-conf-and-how-do-i-use-it/3533
  # execute the installer script for pihole
  exec { 'install-pihole':
    command => 'curl -sSL https://install.pi-hole.net | bash',    
  }
}
