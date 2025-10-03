#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"


id=$(id -u)

if [ $id -ne 0 ]; then
    echo -e " $R Please execute this script as root user privilage $N"
    exit 1
fi

sudo dnf install nginx -y
if [ $? -ne 0 ]; then
    echo -e "ERROR: Installing nginx is $R Failed $N"
else
    echo -e "intalling nginx is $G Success $N"
fi
