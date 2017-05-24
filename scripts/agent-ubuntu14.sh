#!/bin/bash

######################################

# Cai dat Zabbix-agent 3.0

# OS: Ubuntu14.04

#####################################


hostname=`uname -n`

echo "Nhap IP Zabbix Server"

read ip

# Tai cac goi cai dat

echo "Tai cac goi cai dat"

sleep 3

wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb

dpkg -i zabbix-release_3.0-1+trusty_all.deb

apt-get update

# Tai goi Zabbix

echo "Tai goi Zabbix-agent"

sleep 3

apt-get install zabbix-agent -y

# Cau hinh Zabbix-agent

echo "Backup file cau hinh"

cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bka

echo "Cau hinh dich vu Zabbix-agent"

sed -i "s/Server=127.0.0.1/Server=$ip/g" /etc/zabbix/zabbix_agentd.conf

sed -i "s/ServerActive=127.0.0.1/ServerActive=$ip/g" /etc/zabbix/zabbix_agentd.conf

sed -i "s/Hostname=Zabbix server/Hostname=$hostname/g" /etc/zabbix/zabbix_agentd.conf

service zabbix-agent restart



