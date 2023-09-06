#!/bin/bash
# exit on error
set -e

# variables

# EXAMPLE: if path to list_of_servers is /home/bob/list_of_servers/ then homepath would be homepath="/home/bob/"
homepath="/path/to/list_of_servers/"
# EXAMPLE set username
user="username"

# install Splunk enterprise tar file into a directory
wget -O splunk-9.1.1-64e843ea36b1-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.1.1/linux/splunk-9.1.1-64e843ea36b1-Linux-x86_64.tgz" -P $homepath/

# generate ssh key pair
ssh-keygen -t rsa

# IMPORTANT: requires a list of servers in a text file in user's home directory
for $ip in `cat $homepath/list_of_servers`; do

ssh-copy-id $user@$ip

# scp splunk tar and stage in user home directory
scp -i ~/.ssh/id_rsa.pub /$homepath/splunk-9.1.1-64e843ea36b1-Linux-x86_64.tgz $user@$ip:$homepath
	
done
