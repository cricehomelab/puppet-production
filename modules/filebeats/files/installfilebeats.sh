#! bash.sh

cd /home/charlie/

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.5.2-amd64.deb
sudo dpkg -i filebeat-8.5.2-amd64.deb

cp /tmp/secrets/puppet_secretrepo/filebeat/filebeat.yml /etc/filebeat/filebeat.yml

systemctl start filebeat

filebeat modules enable logstash

systemctl restart filebeat