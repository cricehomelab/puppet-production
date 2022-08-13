
# this node is for pihole. 
node "janus-main.local" {
    include pihole
    include networking
}

node "dionysus-main.local" {
    include networking
}

nodee "geppetto-main.local" {
    include networking
}

# setting a default node.
node "default" {
    include networking
}
