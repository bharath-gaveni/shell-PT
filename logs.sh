#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"

id=$(id -u)

if [ $id -ne 0 ]; then
    echo -e "$R Please run the script with root user privilage access $N"
    exit 1
fi

log_folder=/var/log/shell-PT
script_name=$(echo $0 | cut -d "." f1)
log_file=$log_folder/$script_name.log

mkdir -p $log_folder

