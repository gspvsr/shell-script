#!/bin/bash

#function :
#you will keep some code inside functions which is more often repeated, and call whenever you require
#Functions will do some work on behalf of us and it will update what happened.

USERID=$(id -u)
# This function should validate the previous command and inform user it is success or failure.

VALIDATE(){
#$1 ---> it will receive teh argument1
if [ $? -ne 0 ]
then
    echo "Installation of mysql is error"
    exit 1
else    
    echo "Installation of mysql is success"
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

