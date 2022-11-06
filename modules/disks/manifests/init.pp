# makes sure my media disk is mounted for my jellyfin instance. 
class disks {
  exec { 'mount-disk' :
      command  => 'mount /dev/sdb1 /media/movies',
      provider => shell,
      unless   => 'test -d /media/movies/Anime',
  }
}
