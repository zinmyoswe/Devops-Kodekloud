The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/cluster present on Storage server in Stratos DC. However, they reported an issue with the recent commits being pushed to this repo. They have asked the DevOps team to revert repo HEAD to last commit. Below are more details about the task:


In /usr/src/kodekloudrepos/cluster git repository, revert the latest commit ( HEAD ) to the previous commit (JFYI the previous commit hash should be with initial commit message ).


Use revert cluster message (please use all small letters for commit message) for the new revert commit.

Solution:

ssh natasha@ststor01
sudo su -

cd /usr/src/kodekloudrepos/cluster

#check cluster file is commit or not
git status

#latest commit and -n is no message
git revert HEAD -n

#git commit file change to last commit
git status

git add .
git commit - "revert cluster"