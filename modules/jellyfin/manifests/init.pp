class jellyfin {
  service { 'jellyfin':
    ensure => running,
    enable => true,
  } 
}
