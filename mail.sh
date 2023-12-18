#!/bin/bash

# anyone in your project can call this script with arguments
# MAIL.SH TO_ADDRESS 

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[]\/$*.^[]/\\$/g' <<< $3)
echo "escaped content :$BODY"

TEAM_NAME=$4
ALERT_TYPE=$5

# echo "all args : $@"

FINAL_BODY=$(sed -e "s/TEAM-NAME/$TEAM_NAME/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/MESSAGE/$BODY" templete.html)

echo "$FINAL_BODY" | mail -s "$SUBJECT" $TO_ADDRESS

