#!/bin/bash

USERID$(id -u)

if [ $USERID -ne 0 ] 
then
    echo "please proceed with Root User"
    exit1
fi

yum install mysql -y