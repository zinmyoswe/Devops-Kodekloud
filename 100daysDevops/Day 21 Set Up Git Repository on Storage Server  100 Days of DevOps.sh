The Nautilus development team has provided requirements to the DevOps team for a new application development project, specifically requesting the establishment of a Git repository. Follow the instructions below to create the Git repository on the Storage server in the Stratos DC:



Utilize yum to install the git package on the Storage Server.


Create a bare repository named /opt/media.git (ensure exact name usage).

Solution:

ssh natasha@ststor01
sudo su -

yum install -y git
cd /opt/
ls -lah

#normal repo
git init repo-one
#create bare repo
git init --bare media.git

ls -lah /opt/media.git