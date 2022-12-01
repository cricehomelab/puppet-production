#! bash.sh

#used to backup log.
dt=$(date '+%Y%m%d');
newlog=$dt-puppetlog
mv /tmp/logs/puppetlog /tmp/logs/$newlog
touch /tmp/logs/puppetlog

