class jellyfin {
  service { 'jellyfin':
    ensure => running,
  } 
}
