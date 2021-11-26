#!/bin/bash
function pause(){
   read -p "$*"
}

passwd;
sudo -s;
pause ' Nhấn [Enter] để tiếp tục...';
passwd;
vi /etc/hostname;
hostnamectl;
