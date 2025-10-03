#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"

id=$(id -u)

if [ $id -ne 0 ]; then
    echo -e "$R Please execute the script with root user access privilage $N"
    exit 1
fi

validate() {
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 is $R FAILED $N"
        exit 1
    else
        echo -e "Installing $2 is $G SUCCESS $N"
    fi
}

sudo dnf installhjbh nginx -y
validate $? "nginx"

sudo dnf install zip -y
validate $? "zip"

sudo dnf install mysql -y
validate $? "mysql"





