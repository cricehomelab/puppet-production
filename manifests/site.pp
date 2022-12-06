
# primary pihole node. 
node 'janus-main.local' {
    include secretsync
    include filebeats
    include updates 
    include pihole
    include networking
}

# this node is for pihole. This is a secondary node. 
node 'iana-main.local' {
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

# This is the Puppet master. 
node "geppetto-main.local" {
    include updates
    include reposync
    include filebeat
}

# logging node.
node "seshat-main.local" {
    include updates
    include secretsync
    include networking
    include filebeats
    include logging
}

# setting a default node.
node "default" {
    include updates
    include networking
}

