class disks { 

  exec { 'mount-disk' :
      command  => 'mount /dev/sdb1 /media/movies',
      provider => shell,
      onlyif   => 'test -d /home/movies/Anime',
  }
}
