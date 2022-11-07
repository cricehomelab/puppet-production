#! bash.sh

#used to backup log.
dt=$(date '+%Y%m%d');
newlog=$dt-puppetlog
mv /tmp/puppetlog /tmp/$newlog
touch /home/charlie/puppetlog

