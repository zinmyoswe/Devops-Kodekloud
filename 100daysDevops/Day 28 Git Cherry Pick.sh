The Nautilus application development team has been working on a project repository /opt/media.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with the DevOps team:



There are two branches in this repository, master and feature. One of the developers is working on the feature branch and their work is still in progress, however they want to merge one of the commits from the feature branch to the master branch, the message for the commit that needs to be merged into master is Update info.txt. Accomplish this task for them, also remember to push your changes eventually.

Solution:

ssh natasha@ststor01
sudo su -

cd /usr/src/kodekloudrepos
ls
cd media

ls
git status

#cherry pick one commit of feature branch to master
git branch

# find commit 
git log --oneline
f36790c Update info.txt

#in master branch
git checkout master
git branch
git status
git log --oneline

#get commit from feature
git cherry-pick f36790c

git push