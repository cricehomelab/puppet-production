#! bash.sh

# may not work this was written while i installed manually. 

# Requirements for install
apt install zip unzip -y
apt install jq -y
apt install apt-transport-https -y

# GnuPrivacyGuard (GPG) key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

# install elasticsearch

sudo apt-get update && sudo apt-get install elasticsearch > /home/charlie/elastisearchinfo.txt

# reload known Daemons, start and enable elasticsearch
systemctl daemon-reload
systemctl start elasticsearch.service
systemctl enable elasticsearch.service

# final restart of service. 
systmctl restart elasticsearch.service

sudo apt-get install apt-transport-https

sudo apt-get update && sudo apt-get install kibana

bin/elasticsearch-create-enrollment-token -s kibana

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service