#!/bin/bash
rm -f /root/crontab;
wget -P /root/ https://raw.githubusercontent.com/minhvinhdao/DA/main/crontab && chmod 644 /root/crontab;
cd /usr/local/directadmin/custombuild/;
mkdir -p custom/openlitespeed/conf;
wget -P /usr/local/directadmin/custombuild/custom/openlitespeed/conf/ https://raw.githubusercontent.com/minhvinhdao/DA/main/httpd-expires.conf && chmod 644 /usr/local/directadmin/custombuild/custom/openlitespeed/conf/httpd-expires.conf;