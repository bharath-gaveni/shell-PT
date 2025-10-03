#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"

id=$(id -u)

if [ $id -ne 0 ]; then
    echo -e "$R Please execute the script $0 with root user access privilage $N"
    exit 1
fi

log_folder=/var/log/shell-PT
script_name=$(echo $0 | cut -d "." -f1)
log_file=$log_folder/$script_name.log

mkdir -p $log_folder
start_time=$(date +%s)
echo "script $0 execution started at time:$(date)" | tee -a $log_file

validate() {
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 is $R failed $N" | tee -a $log_file
        exit 1
    else
        echo -e "installing $2 is $G Success $N" | tee -a $log_file
    fi
}

for package in "$@"
do
    dnf list installed $package &>>$log_file
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$log_file
        validate $? "$package"
    else
        echo -e "$package is already installed $Y SKIPPING $N" | tee -a $log_file
    fi
done





