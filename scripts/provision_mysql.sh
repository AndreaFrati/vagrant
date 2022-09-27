#!/bin/bash
echo "MySql provisioning - begin"
sudo apt-get install mysql-server mysql-client -y
echo "Updating bind address"
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
echo "Restarting mysql service"
sudo service mysql restart
echo "MySql provisioning - end"