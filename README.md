# spl_pub

Just a repo for scripts that might be helpful

spl_app_ug.sh <br>
Use case: Could be useful when upgrading TA/Apps in bulk prior to platform upgrade <br>
Description: This script takes a backup of the $SPLUNK_HOME/etc/apps/ directory and places it in $SPLUNK_HOME/splunk_upgrade/ directory. Next, all TA/Apps will be upgrades with those stored in $SPLUNK_HOME/splunk_upgrade/ directory. <br>

splunk_stage.sh <br>
Use case: This could be used in preparation for Splunk upgrade <br>
Description: This script requires a list of servers, which are full Splunk instances requiring upgrade. This script will download Splunk, generates SSH keys to authenticate to the instances defined in the list, and copies the downloaded Splunk to the Splunk instances in the list using scp. <br>
