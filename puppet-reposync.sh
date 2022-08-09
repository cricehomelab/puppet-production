#! bash.sh

# add ssh key
eval "$(ssh-agent -s)"
ssh-add /home/charlie/.ssh/github

# synchronize repo with puppetmaster server. 
cd /etc/puppetlabs/code/environments/production/
git pull git@github.com:cricehomelab/puppet-production.git
