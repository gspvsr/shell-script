#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDR/$0-$DATE.log
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
    if [ $i -ne 0 ];
    then    
        echo -e "$R "Installing $2 ... $R FAILURE $N"
        exit 1
    elose
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}
    
#all args are in $@
for i in $@
do 
    yum list installed $i &>>$LOGFILE
    if [ $i -ne 0 ]
    then
        echo "$i is not installed, lets install it"
        yum install $i -y &>>$LOGFILE
        vALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi
    #yum install $i -y
done