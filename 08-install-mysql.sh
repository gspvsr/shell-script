#!/bin/bash

#Install mysql

USERID=$(id -u)

If [ $USERID -ne 0]
then
    echo "ERROR : Please run this script with root user"
    #not 
fi