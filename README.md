## Docker MySQL Autobackup to Google Drive
Docker auto backup MySQL database to Google Drive

#### Prerequisites
- have docker installed on system
- have MySQL or Another DB on system
- have rclone installed and setting to google drive

#### How to use
```bash
$backupdb.sh folderbackup yourdb root <your drive name at rclone setting> yourdrivebackup
```
To automate on your system, you can use **crontab**

`$ crontab -e`

Here an example for backup DB everyday at 23 PM

`00 23 * * *      /home/backup/backupdb.sh mysqlbackup mydb root drive DriveBackup`
