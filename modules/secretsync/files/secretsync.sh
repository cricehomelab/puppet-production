#! bash.sh

# ensure a file is present to log
Logfile=/tmp/logs/secretsync
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
cd /tmp/secrets/
git pull git@github.com:cricehomelab/puppet_secretrepo.git >> $Logfile