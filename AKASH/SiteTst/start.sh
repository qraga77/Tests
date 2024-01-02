#!/bin/bash
TZ=Europe/London && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
source $HOME/.bashrc
apt-get install -y sudo nano wget tar zip unzip jq ssh nginx git
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
service nginx start
sleep 5
rm /var/www/html/index.nginx-debian.html
cd /var/www/html/
git clone https://github.com/qraga77/SiteTst .
