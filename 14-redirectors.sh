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

CHECK_ROOT
