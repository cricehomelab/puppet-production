#! bash.sh

# ensure a file is present to log
Logfile=/home/charlie/puppetlog
if test -f "$Logfile";
then
    echo "$Logfile exists"
else
    touch $Logfile
fi

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt synching repo from github." >> $Logfile

# add ssh key
eval "$(ssh-agent -s)"
ssh-add /home/charlie/.ssh/github

# synchronize repo with puppetmaster server. 
cd /etc/puppetlabs/code/environments/production/
git pull git@github.com:cricehomelab/puppet-production.git >> $Logfile

