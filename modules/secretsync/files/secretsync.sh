#! bash.sh

cd /tmp/secrets/

# ensure a file is present to log
Logfile=/tmp/logs/secretsync/puppet_secretrepo
if test -f "$Logfile";
then
    echo "$Logfile exists"
else
    touch $Logfile
fi

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt synching secrets repo from github." >> $Logfile

# add ssh key
eval "$(ssh-agent -s)"
ssh-add /home/charlie/.ssh/github

# synchronize repo with puppetmaster server. 
git pull git@github.com:cricehomelab/puppet_secretrepo.git >> $Logfile

if test -f "/etc/pihole/"
then
    cp /tmp/secrets/pihole/setupvars.conf /etc/pihole/setupVars.conf
fi

rm -r /tmp/ssh-XXXXXX*