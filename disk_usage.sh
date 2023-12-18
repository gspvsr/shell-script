#!/bin/bash

#any script should have mandatory the following :
#colors
#validations
#log redirections

LOGFILE=DIRECTORY=/tmp
DATE=$(date +F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filelsystem')
DISK_USAGE_THRESHOLD=1

#IFS=means Internal field seperator is space.
while IFS= read line
do
    echo "output: $line"
done <<< $DISK_USAGE