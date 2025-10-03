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

start_time=$(date +%s)
echo "script $0 execution started at time: $(date)" | tee -a $log_file

validate() {
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 is $R Failed $N" | tee -a $log_file
        exit 1
    else
        echo -e "installing $2 is $G Success $N" | tee -a $log_file
    fi
}

dnf list installed nginx -y &>>$log_file
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$log_file
    validate $? "nginx"
else
    echo -e "nginx is already installed $Y SKIPPING $N" | tee -a $log_file
fi

dnf list installed zip -y &>>$log_file
if [ $? -ne 0 ]; then
dnf install zip -y &>>$log_file
validate $? "zip"
else 
    echo -e "zip is already installed $Y SKIPPING $N" | tee -a $log_file
fi

dnf list installed mysql -y &>>$log_file
if [ $? -ne 0 ]; then
dnf install mysql -y &>>$log_file
validate $? "mysql"
else
    echo -e "mysql is already installed $Y SKIPPING $N" | tee -a $log_file
fi

end_time=$(date +%s)
TOTAL_TIME=$(($end_time-$start_time))
echo "Time taken to execute the script $0 is: $TOTAL_TIME seconds" | tee -a $log_file
















