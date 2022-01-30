#!/bin/bash
function pause(){
   read -p "$*"
}
#
#
# OPcache
cd /usr/local/directadmin/custombuild;
mkdir -p custom/opcache/;
rm -f /usr/local/directadmin/custombuild/custom/opcache/opcache.ini;
wget -P /usr/local/directadmin/custombuild/custom/opcache/ https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/FULLNEW/opcache.ini && chmod 644 /usr/local/directadmin/custombuild/custom/opcache/opcache.ini;
cd /usr/local/directadmin/custombuild;
./build opcache;
php -i | grep opcache;
#
#
# Memcache
#
#
yum install memcached -y;
yum install memcached-devel -y;
yum install libmemcached-devel -y;
yum install libmemcached -y;
rm -f /etc/sysconfig/memcached;
rm -f /etc/sysconfig/memcached.1;
wget -P /etc/sysconfig/ https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/FULLNEW/memcached && chmod 644 /etc/sysconfig/memcached;
wget https://raw.githubusercontent.com/poralix/directadmin-utils/master/php/php-extension.sh -O php-extension.sh;
chmod 750 php-extension.sh;
./php-extension.sh;
./php-extension.sh install memcached;
./php-extension.sh status memcached;
chkconfig memcached on;
service memcached start;
systemctl restart memcached;
netstat -nltp | grep 11211;
netstat -nltp | grep memcached;
#
#
# OpenLiteSpeed
#
#
wget -P /root/ https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/FULLNEW/crontab && chmod 644 /root/crontab;
cd /usr/local/directadmin/custombuild/;
mkdir -p custom/openlitespeed/conf;
wget -P /usr/local/directadmin/custombuild/custom/openlitespeed/conf/ https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/FULLNEW/httpd-expires.conf && chmod 644 /usr/local/directadmin/custombuild/custom/openlitespeed/conf/httpd-expires.conf;
#
#
# DirectADmin PHP.ini
#
#
# cd /usr/local/directadmin/conf/;
# rm -f php.ini;
# wget https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/FULLNEW/php.ini;
# chmod 644 php.ini;
#
#
# PHP56
#
#
rm -f /usr/local/php56/lib/php.ini;
wget -P /usr/local/php56/lib/ https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/PHP5.6/php.ini && chmod 644 /usr/local/php56/lib/php.ini;
#
#
# PHP73
#
#
rm -f /usr/local/php73/lib/php.ini;
wget -P /usr/local/php73/lib/ https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/PHP7.3/php.ini && chmod 644 /usr/local/php73/lib/php.ini;
#
#
# PHP74
#
#
rm -f /usr/local/php74/lib/php.ini;
wget -P /usr/local/php74/lib/ https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/PHP7.4/php.ini && chmod 644 /usr/local/php74/lib/php.ini;
#
#
# PHP81
#
#
rm -f /usr/local/php74/lib/php.ini;
wget -P /usr/local/php74/lib/ https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/PHP8.1/php.ini && chmod 644 /usr/local/php74/lib/php.ini;

#
#
# Add Domain
#
#
ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime;
date;
wget https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/FULLNEW/add-domain.txt -P /var/www/html/ && chmod 644 /var/www/html/add-domain.txt;
#
#
# DirectAdmin Config
#
#
/usr/local/directadmin/directadmin set notify_on_license_update 0;
/usr/local/directadmin/directadmin set check_subdomain_owner 0;
/usr/local/directadmin/directadmin set one_click_pma_login 1;
killall -9 directadmin;
service directadmin restart;
#
#
# Change Port DA 7379
# cd /usr/local/directadmin/conf/;
# vi directadmin.conf;
/usr/local/directadmin/directadmin set port 7379;
killall -9 directadmin;
service directadmin restart;
#
#
# Change Port SSH
# vi /etc/ssh/sshd_config;
# /etc/ssh/sshd_config set port 7979;
cd /etc/ssh;
wget https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/FULLNEW/sshd_config && chmod 600 /etc/csf/sshd_config;
chown -R root:root sshd_config;
service sshd restart;
# nano /etc/csf/csf.conf;
cd /etc/csf;
wget https://raw.githubusercontent.com/minhvinhdao/DA-Entertaiment/main/FULLNEW/csf.conf && chmod 600 /etc/csf/csf.conf;
chown -R root:root csf.conf;
csf -r;
#
#
# One Click PHPMYAMIN
#
#
cd custombuild;
./build update;
./build set phpmyadmin_public no;
./build phpmyadmin;
./build rewrite_confs;
# 
# 
# Restart DirectAdmin
service directadmin restart;
# 
# 
# Restart OPENLITESPEDD
systemctl restart lsws;
# 
# 
# Restart REDIS
/etc/init.d/redis-server restart;
# 
# 
# Restart MEMCACHED
service memcached start;
systemctl restart memcached;
# 
# 
systemctl restart
pause '                        Nhấn [Enter] để tiếp tục...';
# Restart VPS
reboot;
clear;