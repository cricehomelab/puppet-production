
# filepaths to the files we are manipulating
$hosts_file     = '/etc/hosts'
$ip_config_file = '/etc/netplan/50-cloud-init.yaml'

# Setting dns to be equal to the pihole. 
$ip_params = {
  $ipaddress  => ::facts[networking][ip]
  $gateway    => "192.168.50.1"
  $macaddress => ::facts[networking][mac]
  $dnsserver  => "192.168.50.128"
}

# configuration of hosts file. 
$hosts_params = {
  $hostname  => ::facts[networking][hostname]
  $fqdn      => ::facts[networking][fqdn]
  $ipaddress => ::facts[networking][ip]
}

$ip_output    = epp('networking/50-cloud-init.yaml.epp', $ip_params)
$hosts_output = epp('networking/hosts.debian.tmpl.epp', $hosts_params)

# goal here is to ensure the DNS is routing to our pihole. 
# Routing to pihole means we don't need DNS records on all machines. 
# This centralizes the DNS records.


