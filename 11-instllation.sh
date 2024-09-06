#!/bin/bash

USERID=$(id -u)

#echo "USER ID is: $USERID"


if [ USERID -ne 0 ]
then 
    echo"Please run the script with root previlages"
    exit 1
fi


dnf install git -y