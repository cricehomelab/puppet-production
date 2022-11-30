#! bash.sh

cd /tmp/secrets

# initialize git dir
git init -b master

# add ssh key
eval "$(ssh-agent -s)"
ssh-add /home/charlie/.ssh/github

# synchronize repo with puppetmaster server. 
cd /tmp/secrets/
git pull git@github.com:cricehomelab/puppet_secretrepo.git