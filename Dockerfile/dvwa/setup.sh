#!/bin/env bash

set -e

apt-get -y update && apt-get -y install curl supervisor php-gd

# note: pushd won't work

rm /var/www/html/index.html

# config dvwa
cd /var/www/html
chown -R www-data:www-data dvwa

# replace deprecated mysql_ apis
# find . -type f -print0 | xargs -0 perl -pi -e 's/mysql_/mysqli_/g'

# config php
cd /etc/php/7.0/apache2
perl -pi -e 's/allow_url_include.*$/allow_url_include = On/' php.ini


# setup mysql
service mysql restart
mysql -e "create database dvwa;"
mysql -e "grant all privileges on dvwa.* to 'dvwa'@'localhost' identified by 'p@ssw0rd';"
mysql -e "flush privileges;"
mysql -udvwa -pp@ssw0rd -e "show databases;"

# check
service apache2 restart
service mysql restart
echo "Success!"

