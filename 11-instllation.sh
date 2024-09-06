#!/bin/bash

USERID=$(id -u)

#echo "USER ID is: $USERID"


if [ $USERID -ne 0 ]
then 
    echo"Please run the script with root previlages"
    exit 1
fi

dnf list installed gitttt

if [ $? -ne 0 ]
then 
    echo "Git is not installed ,going to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Git installation is not success...check it"
    else
        echo "Git is installation is success"
    fi     
else
    echo "Git is already installed.."
fi
    