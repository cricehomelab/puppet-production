class disks { 

  exec { 'mount-disk'
      command => 'mount /dev/sdb1 /media/movies',
      unless => 'test -d /home/movies/Anime',
  }

}
