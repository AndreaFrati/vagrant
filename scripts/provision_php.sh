#!/usr/bin/env bash 
apt update 
apt install -y php 
apt install -y php-mysql

sudo phpenmod mysqli
sudo service apache2 restart