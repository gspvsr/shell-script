#!/bin/bash

#Install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run this script with root user"
    exit 1
    #not 
fi

yum install git -y 