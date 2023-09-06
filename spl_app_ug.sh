#!/bin/bash -vex
########################
#
# Upgrade Splunk TA/Adds
#
########################
# exits when any command fails

# make upgrade staging directory
mkdir /opt/splunk/splunk_upgrade/

# variables
splunk_home="/opt/splunk"

# take backup of app directory
tar zcf $splunk_home/splunk_upgrade/splunk_apps_backup.tgz $splunk_home/etc/apps/

# update each TA/Add-on staged in the splunk_app_upgrade folder

for app in $splunk_home/splunk_app_upgrade/*.tgz ; do

       tar zxf "$app" -C $splunk_home/etc/apps ;

done
