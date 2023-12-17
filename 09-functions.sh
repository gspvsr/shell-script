#!/bin/bash

#Our program goal is to be install

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m
G="\e[32m
N="\e[0m

VALIDATE(){
    #$1---> it will receive the argument1
if [ $1 -ne 0 ]
then
    echo "$2.....$R is FAILURE $N"
    exit 1
else
    echo "$2 ......$G is SUCCESS $N"
fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run this script with root user"
    exit 1
    #not 
fi

# it is our responsibility again to check installin is success or not
yum install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MySQL"


yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installing postfix"