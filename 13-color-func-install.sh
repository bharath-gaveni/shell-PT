#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"

id=$(id -u)

if [ $id -ne 0 ]; then
    echo -e "$R Please execute this script with root access privilage $N"
    exit 1
fi

validate() {
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 is $R Failed $N"
        exit 1
    else
        echo -e "Installing $2 is $G Success $N"
    fi
}

dnf list installed nginx -y
if [ $? -ne 0 ]; then
dnf install nginx -y
validate $? "nginx"
else
    echo -e "nginx is already installed $Y SKIPPING $N"
fi 

dnf list installed zip -y
if [ $? -ne 0 ]; then
dnf install zip -y
validate $? "zip"
else
    echo -e "zip is already installed $Y SKIPPING $N"
fi    

dnf list installed mysql -y
if [ $? -ne 0 ]; then
dnf install mysql -y
validate $? "mysql"
else
    echo -e "mysql is already installed $Y SKIPPING $N"
fi
  


