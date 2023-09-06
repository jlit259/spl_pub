#!/bin/bash

# update and upgrade servers locally install splunk

# variables
# IMPORTANT replace <user> with username
# IMPORTANT replace <splunk user> with splunk user
# IMPORTANT replace </path/to/list_of_servers> with full path to list_of_server containing full Splunk instances requiring upgrade
homepath="/home/<user>"
splunk_user="<splunk user>"
splunk_home="/opt/splunk"
listpath="</path/to/list_of_servers>"

sudo mv $homepath/splunk-9.1.1-64e843ea36b1-Linux-x86_64.tgz /opt
$splunk_home/bin/splunk stop

# change to /opt directory
cd /opt

# untar updated splunk tar file
sudo tar xzf splunk-9.1.1-64e843ea36b1-Linux-x86_64.tgz

# enable splunk to boot start as splunk user and accept splunk eula
sudo $splunk_home/bin/splunk enable boot-start -user $splunk_user --accept-license

# become splunk user
sudo su $splunk_user

# start splunk as splunk user
$splunk_home/bin/splunk start

exit

# upgrade the rest of the Splunk instances in the list_of_servers
for ip in `cat $listpath/list_of_servers`; do
ssh $ip << EOF

sudo mv $homepath/splunk-9.1.1-64e843ea36b1-Linux-x86_64.tgz /opt
$splunk_home/bin/splunk stop

cd /opt
sudo tar xzf splunk-9.1.1-64e843ea36b1-Linux-x86_64.tgz

sudo $splunk_home/bin/splunk enable boot-start -user $splunk_user --accept-license

sudo su $splunk_user

$splunk_home/bin/splunk start

exit
	
EOF

done
