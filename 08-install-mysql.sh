#!/bin/bash

#Install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run this script with root user"
    exit 1
    #not 
fi

# it is our responsibility again to check installin is success or not
yum install mysql -y 

if [ $? -ne 0 ]
then
    echo "Installation of mysql is error"
    exit 1
else
    echo "Installtion of mysql is success"
fi

yum install postfix -y

if [ $? -ne 0 ]
then
    echo "Installation of postfix is error"
    exit 1
else
    echo "Installtion of postfix is success"
fi
