#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR:: Please run script with root access $N "
    exit 1
fi

VALIDATE(){
    if [ $? -ne 0 ];
    then    
        echo -e "$R Installing $2 ... FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}
    
# All args are in $@
for i in $@
do 
    yum list installed $i &>>$LOGSFILE
    if [ $? -ne 0 ]
    then
        echo "$i is not installed, let's install it"
        yum install $i -y &>>$LOGSFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi
done
