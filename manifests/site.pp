
# this node is for pihole.
node 'iana-main.local' {
    include secretsync
    include filebeats
    include updates 
    include pihole
    include networking
}
node 'janus-main.local' {
    include secretsync
    include filebeats
    include updates 
    include pihole
    include networking
}

# Jellyfin node
node "dionysus-main.local" {
    include filebeats
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
    include updates
    include secretsync
    #include networking
    #include logging
}

# setting a default node.
node "default" {
    include updates
    include networking
}

