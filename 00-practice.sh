#!/bin/bash

USERID$(id -u)

if [ $USERID -ne 0 ] 
then
    echo "please proceed with Root User"
else
    echo "installation is not successful"
fi

yum install mysql -y