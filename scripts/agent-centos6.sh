#!/bin/bash

######################################

# Cai dat Zabbix-agent 3.0

# OS: Centos 6.9

#####################################

# Khai bao bien

hostname=`uname -n`

echo "Nhap IP Zabbix Server"

read ip

# Tai cac goi cai dat

echo "Tai goi cai dat Zabbix"

rpm -Uvh http://repo.zabbix.com/zabbix/3.0/rhel/6/x86_64/zabbix-release-3.0-1.el6.noarch.rpm

yum update -y

# Tai goi Zabbix-agent

echo "Tai goi Zabbix-agent"

yum install zabbix zabbix-agent -y

# Chinh sua file cau hinh

echo "Backup file cau hinh"

cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bka

echo "Cau hinh dich vu Zabbix-agent"

sed -i "s/Server=127.0.0.1/Server=$ip/g" /etc/zabbix/zabbix_agentd.conf

sed -i "s/ServerActive=127.0.0.1/ServerActive=$ip/g" /etc/zabbix/zabbix_agentd.conf

sed -i "s/Hostname=Zabbix server/Hostname=$hostname/g" /etc/zabbix/zabbix_agentd.conf

# Tao rule cho firewall

sed -i "s/COMMIT/-A INPUT -p tcp -m state --state NEW -m tcp --dport 10050 -j ACCEPT/g" /etc/sysconfig/iptables

echo "COMMIT" >> /etc/sysconfig/iptables

# Khoi dong lại IPtables

/etc/init.d/iptables restart

# Khoi dong lai Zabbix-agent

/etc/init.d/zabbix-agent restart && chkconfig zabbix-agent on


