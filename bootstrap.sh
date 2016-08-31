#!/usr/bin/env bash

cp /vagrant/bash_aliases /home/vagrant/.bash_aliases 

sudo apt-get update >/dev/null
sudo apt-get install -y openjdk-7-jdk maven ant postgresql tomcat7 git apache2


[ ! -d /vagrant/source ] && mkdir /vagrant/source
[ ! -d /yorkspace ] && sudo mkdir /yorkspace && sudo chown vagrant:vagrant /yorkspace
[ ! -L /yorkspace/source ] && ln -s /vagrant/source /yorkspace/source && git clone https://github.com/yorkulibraries/DSpace.git /yorkspace/source/DSpace

cp -f /vagrant/vagrant.properties /yorkspace/source/DSpace
cd /yorkspace/source/DSpace && git checkout yorkspace-5.4 
cd /yorkspace/source/DSpace && mvn -Denv=vagrant -U clean package

sudo -upostgres createuser  --no-superuser dspace
echo "ALTER USER \"dspace\" WITH PASSWORD 'vagrant';" | sudo -upostgres psql
sudo -upostgres createdb  --owner=dspace --encoding=UNICODE dspace

ANT_CMD=fresh_install
DB_DUMP=/vagrant/dspace.daily.dmp
if [ -f $DB_DUMP ]; then
  sudo -upostgres pg_restore -d dspace $DB_DUMP
  ANT_CMD=update
fi

sudo mkdir /dspace
cd /yorkspace/source/DSpace/dspace/target/dspace-installer && sudo ant $ANT_CMD && sudo chown -R tomcat7:tomcat7 /dspace 
sudo cp -f /vagrant/server.xml /etc/tomcat7/
sudo service tomcat7 restart

sudo cp /vagrant/dspace.local.conf /etc/apache2/sites-available/000-default.conf
sudo a2enmod proxy
sudo a2enmod proxy_ajp
sudo a2enmod rewrite
sudo service apache2 restart

echo "Your local YorkSpace instance should now be accessible at http://dspace.local/xmlui/"

if [ "$ANT_CMD"="update" ]; then
  echo "Rebuilding SOLR discovery index, this may take some time."
  sudo -utomcat7 /dspace/bin/dspace index-discovery
fi
