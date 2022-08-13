
# this node is for pihole. 
node "janus-main.local" {
    include pihole
    include networking
}

# setting a default node.
node "default" {
    
}
