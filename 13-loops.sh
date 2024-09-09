#!/bin/bash

  
for package in $@ #@referes to all the arguments passed to it
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.."
        dnf install $package -y
        validate $? "Installing $package"
    else
        echo "$package is already installed..nothing to do"
    fi 
done            