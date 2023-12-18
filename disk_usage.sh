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
DISK_USAGE_THRESHOLD=0
message=""

#IFS=means Internal field seperator is space.
while IFS= read line
do
    #this command will give you usage in number format for comparision
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
    #this command will give us partition
    partition=$(echo $line | awk '{print $1}')
   
    if [[ $usage -gt $DISK_USAGE_THRESHOLD ]];
    then
        message+="HIGH DISK USAGE on $partition: $usage \n"
    fi
done <<< $DISK_USAGE

echo -e "message: $message"