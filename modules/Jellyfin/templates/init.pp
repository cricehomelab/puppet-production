class Jellyfin {
  service { 'jellyfin':
    ensure => running,
  } 
}
