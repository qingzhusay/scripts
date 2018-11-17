#!/bin/env bash

set -e

apt-get -y update
apt-get -y install unzip curl supervisor
apt-get clean && apt-get autoremove

# note: pushd won't work
rm /var/www/html/index.html

cd /var/www/html
unzip bWAPP_latest.zip && rm bWAPP_latest.zip
chown -R www-data:www-data bWAPP

# setup mysql
service mysql restart
# must grant to 'root'@'localhost' that identified by 'bug'
mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by 'bug';"
mysql -uroot -pbug -e "grant all privileges on *.* to 'alice'@'%' identified by 'loveZombies';"
mysql -uroot -pbug -e "flush privileges;"
mysql -ualice -ploveZombies -e "show databases;"

# check
service apache2 restart
service mysql restart

# installation
curl http://127.0.0.1/bWAPP/install.php?install=yes 1> /dev/null

echo "Install bwapp success!"

