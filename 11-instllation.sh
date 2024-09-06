#!/bin/bash

USERID=$(id -u)

#echo "USER ID is: $USERID"

#ne is special variable

if [ $USERID -ne 0 ]
then 
    echo"Please run the script with root previlages"
    exit 1
fi

dnf list installed git #list all installed packages in git

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

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "MySql is not installed..going to install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "Mysql installation is failure..please check"
        exit 1
    else 
        echo "My Sql installation is success"             
    fi
else
    echo "MySql is already installed."   
fi          