#!/bin/bash
clear
tput cup 10 10
echo -n "Enter the dir name :"
read a
tput cup 11 10
echo -n "Enter the path: "

read b
tput cup 12 10
echo -n "Enter the comment: "
read c
mkdir $b
echo "
[$a]
  comment = $c
  public = yes
  printable = no
  writable = yes
  path = $b" >> /etc/samba/smb.conf
service smb restart >> /dev/null
