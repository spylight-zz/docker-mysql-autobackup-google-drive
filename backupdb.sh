#!/bin/bash
##this script will backup mysql and upload it to google drive
dirname=$1;
database=$2;
dbuser=$3;
rcloneRemoteName=$4;
gdrivefoldername=$5;
dbpass="your-db-password";
##condition to check folder exist or not
backup_dir="${dirname}"
sdate=$(date +%F_%H%M%S)
backup_filename="${backup_dir}/${database}_${sdate}.sql.gz"
if [ ! -d "$dirname" ]
then
    ##create directory
    mkdir $backup_dir
fi
##dump mysql database on server
docker exec <container id/name> /usr/bin/mysqldump -u $dbuser --password=$dbpass $database | gzip > $backup_filename
##wait for 10 seconds
sleep 10
##upload it to google drive
rclone copy "${backup_filename}" $rcloneRemoteName:$gdrivefoldername
##delete 10 days older file on server to save disk space(optional for this command)
find $backup_dir -mtime +10 -type f -delete
