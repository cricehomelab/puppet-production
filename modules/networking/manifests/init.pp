class networking {
  # filepaths to the files we are manipulating
  $hosts_file = '/etc/cloud/templates/hosts.debian.tmpl'
  $ip_config_file = '/etc/netplan/50-cloud-init.yaml'

  # Setting dns to be equal to the pihole. 
  $ip_params = {
    "ipaddress"  => $::facts[networking][ip],
    "macaddress" => $::facts[networking][mac],
  }

  # configuration of hosts file.
  $hosts_params = {
    "hostname"  => $::facts[networking][hostname],
    "fqdn"      => $::facts[networking][fqdn],
    "ipaddress" => $::facts[networking][ip],
  }

  $ip_output    = epp('networking/50-cloud-init.yaml.epp', $ip_params)
  $hosts_output = epp('networking/hosts.debian.tmpl.epp', $hosts_params)

  # The goal here is to ensure the DNS is routing to our pihole. 
  # Routing to pihole means we don't need DNS records on all machines. 
  # This centralizes the DNS records.

  # Part1: setting DNS correctly for device.
  file { $ip_config_file :
    ensure  => present,
    content => $ip_output,
  }

  # Part2: applying IP correctly.
  exec { 'netplan_application':
    command     => 'netplan apply',
    provider    => shell,
    subscribe   => File[$ip_config_file],
    refreshonly => true,
  }

  # Part3: Updating hosts
  file { $hosts_file :
    ensure  => present,
    content => $hosts_output,
    require => File[$ip_config_file],
  }
}
