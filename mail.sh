#!/bin/bash

# anyone in your project can call this script with arguments
# MAIL.SH TO_ADDRESS 

TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

# echo "all args : $@"

FINAL_BODY=$(sed -e 's/TEAM-NAME/DevOps Team/g' -e 's/ALERT_TYPE/high Disk Usage/g' -e "s/MESSAGE/$BODY" templete.html)

echo "$FINAL_BODY" | mail -s "$SUBJECT" $TO_ADDRESS

