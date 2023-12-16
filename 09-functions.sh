#!/bin/bash

#function :
#you will keep some code inside functions which is more often repeated, and call whenever you require
#Functions will do some work on behalf of us and it will update what happened.

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

USERID=$(id -u)

# This function should validate the previous command and inform user it is success or failure.
VALIDATE(){
#?1 will receive teh argument1

if [ $? -ne 0 ]
then
    echo " $2...... is error"
    exit 1
else    
    echo " $2....... is success"
fi
}

if [ $USERID -ne 0 ]
then 
    echo "ERROR : Please run this script with root access"
    exit 1
# else
#   echo :"INFO:: you are root user"
fi

# it is our responsibility again to check installation is success or not
yum install mysql -y
VALIDATE $? "Installing MYSQL"

yum install postfix -y
VALIDATE $? "Installing postfix"

