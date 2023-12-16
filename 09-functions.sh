#!/bin/bash

#function :
#you will keep some code inside functions which is more often repeated, and call whenever you require
#Functions will do some work on behalf of us and it will update what happened.

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo "$2...... is FAILURE"
        exit 1
    else    
        echo "$2....... is SUCCESS"
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR : Please run this script with root access"
    exit 1
# else
#   echo :"INFO:: you are root user"
fi

# it is our responsibility again to check installation is success or not
yum install mysql -y $>>$LOGFILE
VALIDATE $? "Installing MYSQL"

yum install postfix -y $>>$LOGFILE
VALIDATE $? "Installing postfix"

