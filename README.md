Welcome to my lab documentation. 

This lab build is to strengthen a few things.
1. I am working on builiding a better understanding of infrastructure as code.
    a. Based on this consideration. I am taking steps with every new change to build my infrastructure as programatically as possible.
    b. My first main "tool" to accomplish this is Puppet.
        i. Puppet was selected as this is being used in my workplace, and I want to learn about this tool so I can be a part of that team.
2. I would like to have some of the cool bells and whistles/conveniance things for my day to day life.
    a. For example, I've used pihole before, but I've not really spent a lot of time with it. I think now is a good opportunity to learn more about it.
    b. Another example would be using Jellyfin as a home media server to store various media.
3. Logging is a weak point of mine and I'd like to strengthen it by setting up and configuring logging in my homelab. So I can monitor my work remotely.


Current functionality.

NAME:           pve1
Function:       PROXMOX HYPERVISOR
Hardware:       Dell Optiplex 7010 32GB RAM

    NAME:           geppetto-main
    FUNCTION:       Puppetmaster
    IP:             192.168.50.127
    STATUS:         Live

    NAME:           janus-main
    FUNCTION:       Pi-hole
    IP:             192.168.50.128
    STATUS:         Live

    NAME:           dionysus-main
    FUNCTION:       Jellyfin
    IP:             192.168.50.130
    STATUS:         live

    NAME:           iana-main
    FUNCTION:       Secondary Pihole (Secondary DNS server)
    IP:             192.168.50.131
    STATUS:         live



