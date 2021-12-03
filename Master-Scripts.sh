#!/bin/bash
server_name=$(hostname)
function pause() {
    read -p "$*"
}
function memory_check() {
    echo ""
    echo "Thông tin Bộ nhớ ${server_name} là: "
    free -h
    echo ""
}
function cpu_check() {
    echo ""
    echo "Thông tin CPU ${server_name} là: "
    echo ""
    lscpu
}
function restart_ols() {
    systemctl restart lsws
}
function install_rclone() {
    curl https://rclone.org/install.sh | sudo bash
}
function install_da_manual() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-auto-sytem-new.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-auto-sytem-new.sh) auto
}
function install_da_auto() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-directadmin.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-directadmin.sh) auto
}
function install_mariadb() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-mariadb.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-mariadb.sh)
}
function install_memcache() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-memcache.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-memcache.sh)
}
function install_openlitespeed() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-openlitespeed.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-openlitespeed.sh)
}
function install_redis() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-redis.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-redis.sh)
}
function one_click_myAdmin() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/one-click-phpmyadmin.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/one-click-phpmyadmin.sh)
}
function install_firewal() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-csf.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-csf.sh)
}
function fix_start() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/fix-start.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/fix-start.sh)
}
function config_ols() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-openlitespeed.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-openlitespeed.sh)
}
function config_opcache() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-opcache.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-opcache.sh)
}
function config_mecache() {
    bash <(curl -Ss https://github.com/minhvinhdao/DA/blob/main/config-memcached.sh || wget -O - https://github.com/minhvinhdao/DA/blob/main/config-memcached.sh)
}
function config_directAdmin() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-directadmin-conf.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-directadmin-conf.sh)
}
function config_auto_system() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-auto-website.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-auto-website.sh)
}
function check_system() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/check-system.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/check-system.sh)
}
function active_da() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/active-directadmin.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/active-directadmin.sh)
}
function config_php56() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-php56.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-php56.sh)
}
function config_php73() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-php73.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-php73.sh)
}
function config_php74() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-php74.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-php74.sh)
}
function config_php80() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-php80.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-php80.sh)
}
function install_da_default {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-directadmin-default.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-directadmin-default.sh) auto
}
function change_port_da() {
    cd /usr/local/directadmin/conf/
    vi directadmin.conf
    killall -9 directadmin
    service directadmin restart
}
function change_port_csf() {
    vi /etc/ssh/sshd_config
    service sshd restart
    vi /etc/csf/csf.conf
    csf -r
}
function reboot_vps() {
    reboot
}

function restart_da() {
    killall -9 directadmin
    service directadmin restart
}

function get_myAdmin_pass() {
    cat /usr/local/directadmin/conf/mysql.conf
}

function get_daAdmin_pass() {
    cat /var/log/directadmin/install.log | grep Admin
}

function change_pass_da() {
    passwd admin
}

function change_pass_vps() {
    passwd root
}

function rename_auto_system() {
    wget -P /root/ https://raw.githubusercontent.com/minhvinhdao/DA/main/doiten.sh && chmod a+x /root/doiten.sh
    pause '                       [Enter] ...'
    cd /root
    ./doiten.sh
}
function active_da() {
    rm -rf /etc/sysconfig/network-scripts/ifcfg-eth0:100
    ifconfig eth0:100 176.99.3.34 netmask 255.255.255.0 up
    echo 'DEVICE=eth0:100' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    echo 'IPADDR=176.99.3.34' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    echo 'NETMASK=255.255.255.0' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    echo 'ONBOOT=yes' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    echo 'BOOTPROTO=none' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    /usr/bin/perl -pi -e 's/^ethernet_dev=.*/ethernet_dev=eth0:100/' /usr/local/directadmin/conf/directadmin.conf
    service network restart
    service directadmin stop
    rm -rf /etc/cron.d/directadmin_cron
    /usr/bin/wget -O /etc/cron.d/directadmin_cron https://raw.githubusercontent.com/minhvinhdao/DA/main/directadmin_cron
    chmod 600 /etc/cron.d/directadmin_cron
    rm -rf /usr/local/directadmin/conf/license.key
    /usr/bin/wget -O /usr/local/directadmin/conf/license.key https://github.com/minhvinhdao/DA/raw/main/license.key
    chmod 600 /usr/local/directadmin/conf/license.key
    chown diradmin:diradmin /usr/local/directadmin/conf/license.key
    service directadmin start
    systemctl disable firewalld
    systemctl stop firewalld
}
function active_da_version() {
    rm -rf /etc/sysconfig/network-scripts/ifcfg-eth0:100
    ifconfig eth0:100 176.99.3.34 netmask 255.255.255.0 up
    echo 'DEVICE=eth0:100' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    echo 'IPADDR=176.99.3.34' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    echo 'NETMASK=255.255.255.0' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    echo 'ONBOOT=yes' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    echo 'BOOTPROTO=none' >>/etc/sysconfig/network-scripts/ifcfg-eth0:100
    /usr/bin/perl -pi -e 's/^ethernet_dev=.*/ethernet_dev=eth0:100/' /usr/local/directadmin/conf/directadmin.conf
    service network restart
    service directadmin stop
    rm -rf /etc/cron.d/directadmin_cron
    /usr/bin/wget -O /etc/cron.d/directadmin_cron https://raw.githubusercontent.com/minhvinhdao/DA/main/directadmin_cron
    chmod 600 /etc/cron.d/directadmin_cron
    rm -rf /usr/local/directadmin/conf/license.key
    /usr/bin/wget -O /usr/local/directadmin/conf/license.key https://github.com/minhvinhdao/DA/raw/main/license.key
    chmod 600 /usr/local/directadmin/conf/license.key
    chown diradmin:diradmin /usr/local/directadmin/conf/license.key
    service directadmin start
    systemctl disable firewalld
    systemctl stop firewalld
    cd /usr/local/directadmin
    wget --no-check-certificate -O update.tar.gz 'https://github.com/minhvinhdao/DA/raw/main/update.tar.gz'
    tar xvzf update.tar.gz
    ./directadmin p
    cd /usr/local/directadmin/scripts
    ./update.sh
    service directadmin restart
    cd /usr/local/directadmin
    rm -f update.tar.gz
}
function install_da_only() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-direct-admin-only.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-direct-admin-only.sh)
}
function install_da_nopre() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-only-no-preconfig.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-only-no-preconfig.sh)
}
function active_da_openvz() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/active-da-openvz.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/active-da-openvz.sh)
}
function change_pass_centos() {
    passwd
}
function change_hostname() {
    vi /etc/hostname
    vi /etc/hosts
}
function speed_test() {
    curl -Lso- tocdo.net | bash
}
function speed_test_share() {
    curl -Lso- tocdo.net/share | bash
}
function pause() {
    read -p "$*"
}
function install_single_da() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/config-single-da.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/config-single-da.sh) auto
}
function config_single_da() {
    bash <(curl -Ss https://raw.githubusercontent.com/minhvinhdao/DA/main/install-single-da.sh || wget -O - https://raw.githubusercontent.com/minhvinhdao/DA/main/install-single-da.sh) auto
}
##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##
ColorGreen() {
    echo -ne $green$1$clear
}
ColorBlue() {
    echo -ne $blue$1$clear
}

menu() {
    echo -ne "
===========================================================
                 DIRECTAMIN MASTER SCRIPT
                 ========================

    +++ SYSTEM  +++
  $(ColorGreen '01)') Thông tin Bộ nhớ VPS
  $(ColorGreen '02)') Thông tin CPU - Cấu hình VPS

    +++ INSTALL +++
  $(ColorGreen '03)') Cài đặt DirectAdmin Default
  $(ColorGreen '45)') Cài đặt DirectAdmin Single
  $(ColorGreen '04)') Cài đặt DirectAdmin Nginx - Apache
  $(ColorGreen '05)') Cài đặt DirectAdmin OpenLiteSpeed
  $(ColorGreen '06)') Cài đặt DirectAdmin Auto System
  $(ColorGreen '07)') Cài đặt OpenLiteSpeed
  $(ColorGreen '08)') Cài đặt MariaDB
  $(ColorGreen '09)') Cài đặt Memcached
  $(ColorGreen '10)') Cài đặt Redis
  $(ColorGreen '11)') Cài đặt FireWall
  $(ColorGreen '12)') Cài đặt Rclone
  
    +++ ACTIVE +++
  $(ColorGreen '13)') Active DirectAdmin Only
  $(ColorGreen '14)') Active DirectAdmin + Version
  $(ColorGreen '15)') Active Direct Admin OpenVZ

    +++ CONFIG +++
  $(ColorGreen '16)') Config Auto System
  $(ColorGreen '46)') Config Single DirectAdmin
  $(ColorGreen '17)') Config DirectAdmin
  $(ColorGreen '18)') Config PhpMyAdmin
  $(ColorGreen '19)') Config OPcache
  $(ColorGreen '20)') Config Mecached
  $(ColorGreen '21)') Config Redis
  $(ColorGreen '22)') Config OpenLiteSpeed
  $(ColorGreen '23)') Config PHP 5.6
  $(ColorGreen '24)') Config PHP 7.3
  $(ColorGreen '25)') Config PHP 7.4
  $(ColorGreen '26)') Config PHP 8.0

    +++ GET +++
  $(ColorGreen '27)') Get DA_Admin SQL Pass
  $(ColorGreen '28)') Get User DirectAdmin Pass

    +++ CHANGE +++
  $(ColorGreen '29)') Change Hostname VPS
  $(ColorGreen '30)') Change Port DirectAdmin
  $(ColorGreen '31)') Change Port SSH VPS
  $(ColorGreen '32)') Change Pass CentOS VPS
  $(ColorGreen '33)') Change Pass Admin DirectAdmin
  $(ColorGreen '34)') Change Pass Root VPS
  $(ColorGreen '35)') Rename Auto System

    +++ RESTART +++
  $(ColorGreen '36)') Restart OpenLiteSpeed
  $(ColorGreen '37)') Restart DirectAdmin
  $(ColorGreen '38)') Fix Start DirectAdmin
  $(ColorGreen '39)') Reboot VPS

    +++ ULTILITIES +++
  $(ColorGreen '40)') Speed Test VPS
  $(ColorGreen '41)') Speed Test VPS + Share
  $(ColorGreen '42)') Clean DirectAdmin
  $(ColorGreen '43)') Clean Auto System

  $(ColorGreen '0)') Exit

===========================================================
$(ColorBlue 'Chọn tuỳ chọn của bạn (Nhập số và nhấn Enter):') 
"
    read a
    case $a in
    1)
        memory_check
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    2)
        cpu_check
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    3)
        install_da_default
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    4)
        install_da_only
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    5)
        install_da_nopre
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    6)
        install_da_manual
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    7)
        install_openlitespeed
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    8)
        install_mariadb
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    9)
        install_memcache
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    10)
        install_redis
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    11)
        install_firewal
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    12)
        install_rclone
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    13)
        active_da
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    14)
        active_da_version
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    15)
        active_da_openvz
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    16)
        config_auto_system
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    17)
        config_directAdmin
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    18)
        one_click_myAdmin
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    19)
        config_opcache
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    20)
        config_mecache
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    21)
        config_redis
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    22)
        config_ols
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    23)
        config_php56
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    24)
        config_php73
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    25)
        config_php74
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    26)
        config_php80
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    27)
        get_myAdmin_pass
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    28)
        get_daAdmin_pass
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    29)
        change_hostname
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    30)
        change_port_da
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    31)
        change_port_csf
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    32)
        change_pass_centos
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    33)
        change_pass_da
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    34)
        change_pass_vps
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    35)
        rename_auto_system
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    36)
        restart_ols
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    37)
        restart_da
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    38)
        fix_start
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    39)
        reboot_vps
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    40)
        speed_test
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    41)
        speed_test_share
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    42)
        clean_da
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    43)
        clean_auto_system
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    45)
        install_single_da
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    46)
        config_single_da
        pause ' Nhấn [Enter] để tiếp tục...'
        menu
        ;;
    0) exit 0 ;;
    *)
        echo -e $red"Lựa chọn của bạn chưa đúng với Menu hiện tại."$clear
        WrongCommand
        ;;
    esac
}

# Call the menu function
menu
