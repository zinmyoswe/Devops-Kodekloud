Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/cluster. Recently, they decided to implement some new features in the clusterlication, and they want to maintain those new changes in a separate branch. Below are the requirements that have been shared with the DevOps team:



On Storage server in Stratos DC create a new branch xfusioncorp_cluster from master branch in /usr/src/kodekloudrepos/cluster git repo.


Please do not try to make any changes in the code.

Solution:

ssh natasha@ststor01

cd /usr/src/kodekloudrepos/
ls
cd clusters

git status
sudo -i
git status
git branch

#go to master branch
git checkout master

#check where are you
git branch

#create new branch
git chekout -b xfusioncorp_clusters

git status

git branch