The xFusionCorp development team added updates to the project that is maintained under /opt/demo.git repo and cloned under /usr/src/kodekloudrepos/demo. Recently some changes were made on Git server that is hosted on Storage server in Stratos DC. The DevOps team added some new Git remotes, so we need to update remote on /usr/src/kodekloudrepos/demo repository as per details mentioned below:


a. In /usr/src/kodekloudrepos/demo repo add a new remote dev_demo and point it to /opt/xfusioncorp_demo.git repository.


b. There is a file /tmp/index.html on same server; copy this file to the repo and add/commit to master branch.


c. Finally push master branch to this new remote origin.

Solution:

ssh natasha@ststor01
sudo su -

cd /usr/src/kodekloudrepos/demo/

#check curret remote
git remote -v

#change new remote
git remote add dev_demo /opt/xfusioncorp_demo.git

#new remote can be see now
git remote -v

ls /tmp/index.html

#copy to current dir
cp /tmp/index.html .

#check branch is master
git branch

git add index.html
git status
git commit -m "added index.html"

#push to new remote branch
git push -u dev_demo master