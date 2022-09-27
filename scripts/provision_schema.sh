#!/bin/bash
DBNAME=vagrant
DBUSER=vagrant
DBPASSWD=vagrantpass
echo "Creating new db $DBNAME"
mysql -uroot  -e "CREATE DATABASE $DBNAME"
mysql -uroot -e "CREATE USER '$DBUSER'@'%' identified by '$DBPASSWD'"
mysql -uroot  -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%'"
mysql -uroot -e "flush privileges"