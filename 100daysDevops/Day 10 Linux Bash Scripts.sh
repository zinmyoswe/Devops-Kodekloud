The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 2 in Stratos Datacenter, and they need to create a bash script named media_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 2).



a. Create a zip archive named xfusioncorp_media.zip of /var/www/html/media directory.


b. Save the archive in /backup/ on App Server 2. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.


c. Copy the created archive to Nautilus Backup Server server in /backup/ location.


d. Please make sure script wont ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.


e. Do not use sudo inside the script.

Note:
The zip package must be installed on given App Server before executing the script. This package is essential for creating the zip archive of the website files. Install it manually outside the script.

Solution:

ssh steve@stapp02

sudo su-

#check folder content
cd /scripts
ls

#create bash script file to run automate day to day backup website 
touch media_backup.sh
ls

#to see file detail access
ls -lah

#give excute permission
chmod +x media_backup.sh

vi media_backup.sh

#!/bin/bash

BK_FILE="xfusioncorp_media.zip"
SOURCE_DIR="/var/www/html/media"
BK_DIR="/backup"

SRV_DIR="/backup/"
SSH_USER="clint"
SSH_HOST="stbkp01"

#create backup zip file
zip -r "${BK_DIR}/${BK_FILE}" "${SOURCE_DIR}"

#copy to backup server
scp "${BK_DIR}/${BK_FILE}" ${SSH_USER}@${SSH_HOST}:${SRV_DIR}

:wq!

#no need password for backupfile
ssh-keygen
#keep enter every time
ssh-copy-id clint@stbkp01

#check auto login is success or not
ssh clint@stbkp01
exit

#to check owner permission
ls -lah /backup/

#give permission owner to steve
sudo chown +R steve /backup/

/scripts/media_backup.sh