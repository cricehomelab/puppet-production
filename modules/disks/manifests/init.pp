class disks { 

  exec { 'mount-disk' :
      command  => 'mount /dev/sdb1 /media/movies',
      provider => shell,
      unless   => 'test -d /media/movies/Anime',
  }
}