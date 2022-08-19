
# this node is for pihole. 
node "janus-main.local" {
    include pihole
    include networking
}

node "dionysus-main.local" {    
    include jellyfin 
    include networking
    include disks
}

# setting a default node.
node "default" {
    include networking
}
