The Nautilus application development team has been working on a project repository /opt/ecommerce.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:



Create a new branch xfusion in /usr/src/kodekloudrepos/ecommerce repo from master and copy the /tmp/index.html file (present on storage server itself) into the repo. Further, add/commit this file in the new branch and merge back that branch into master branch. Finally, push the changes to the origin for both of the branches.

Solution:

ssh natasha@ststor01
sudo su -

ls -lah /usr/src/kodekloudrepos/ecommerce/
cd /usr/src/kodekloudrepos/ecommerce/

#check clean and on master branch
git status

#check which branch are you
git branch

#create new branch and switch to that branch
git checkout -b nautilus

#see branch is change to master to nautilus
git branch

ls /tmp/index.html

#copy to current dir
cp /tmp/index.html .
ls

#can see index.html now
git status

git add index.html
git status
git commit -m "added index.html file"

#new branch merge to master branch
git checkout master
git branch

git log --oneline
git merge nautilus


git log --oneline

#push master branch
git push

#push created branch
git checkout nautilus
git push

git push -u origin nautilus