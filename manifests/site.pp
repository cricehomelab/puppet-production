
# this node is for pihole.
node 'janus-main.local', 'iana-main.local' {
    include updates
    include pihole
    include networking
}

# Jellyfin node
node "dionysus-main.local" {
    include updates
    include jellyfin
    include networking
    include disks
}

node "geppetto-main.local" {
    include updates
    include reposync
}

# logging node.
node "seshat-main.local" {
    #include updates
    #include networking
    #include logging
}

# setting a default node.
node "default" {
    include updates
    include networking
}
