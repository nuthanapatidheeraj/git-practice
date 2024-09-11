#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d ". -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.LOG"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    IF [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root previlages $N" &>>$LOG_FILE
        exit 1
    f1
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is ..$R FAILED $N" &>>$LOG_FILE
        exit 1
    else 
        echo "$2 is .. $G success $N" &>>$LOG_FILE
    fi        
}

USAGE(){
    echo "USAGE:: sudo sh 16-redirectors.sh package1 package 2..."
    exit 1
}

CHECK_ROOT

if [ $# -eq 0 ]
then 
    usage
fi         

for package in $@ #@referes to all the arguments passed to it
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        validate $? "Installing $package"
    else
        echo -e "$package is already $Y installed..nothing to do $N" &>>$LOG_FILE
    fi 
done  
