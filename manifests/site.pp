
# this node is for pihole. 
node 'janus-main.local', 'iana-main.local' {
    include pihole
    include networking
    include updates
}

node "dionysus-main.local" {
    include jellyfin 
    include networking
    include disks
#    include updates
}

node "preprodtest"{
    include networking
}

node "geppetto-main.local" {
#    include updates
    include reposync

}

# setting a default node.
node "default" {
    include networking
}
