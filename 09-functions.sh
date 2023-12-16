#!/bin/bash

#Our program goal is to be install

USERID=$(id -u)

VALIDATE(){
    #$1---> it will receive the argument1

if [ $1 -ne 0 ]
then
    echo "$2..... is FAILURE"
    exit 1
else
    echo "$2 ...... is SUCCESS"
fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run this script with root user"
    exit 1
    #not 
fi

# it is our responsibility again to check installin is success or not
yum install mysql -y 
VALIDATE $? "Installing MySQL"


yum install postfix -y
VALIDATE $? "Installing postfix"