The Nautilus application development team was working on a git repository /opt/cluster.git which is cloned under /usr/src/kodekloudrepos directory present on Storage server in Stratos DC. The team want to setup a hook on this repository, please find below more details:



Merge the feature branch into the master branch, but before pushing your changes complete below point.

Create a post-update hook in this git repository so that whenever any changes are pushed to the master branch, it creates a release tag with name release-2023-06-15, where 2023-06-15 is supposed to be the current date. For example if today is 20th June, 2023 then the release tag must be release-2023-06-20. Make sure you test the hook at least once and create a release tag for todays release.

Finally remember to push your changes.
Note: Perform this task using the natasha user, and ensure the repository or existing directory permissions are not altered.

RequireFile:

cd /opt/cluster.git/hooks
vi update

#!/bin/bash

refname="$1"
oldrev="$2"
newrev="$3"

if [ "$refname" = "refs/heads/master" ]; then
  TAG="release-$(date +%Y-%m-%d)"
  git tag -f "$TAG" "$newrev"
fi

exit 0


Solution:

thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (172.16.238.15)' can't be established.
ED25519 key fingerprint is SHA256:B1lYzCiLk/+VGapsWQmyPNTpQQIHwwrM9cwjA6GWzS4.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? Bl@kW
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/cluster
[natasha@ststor01 cluster]$ git branch
* feature
  master
[natasha@ststor01 cluster]$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
[natasha@ststor01 cluster]$ git merge feature
Updating 6a4e923..dde2e88
Fast-forward
 feature.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 feature.txt
[natasha@ststor01 cluster]$ cd
[natasha@ststor01 ~]$ cd /opt/cluster.git/hooks
[natasha@ststor01 hooks]$ vi post-update
[natasha@ststor01 hooks]$ chmod +x post-update
[natasha@ststor01 hooks]$ ls
applypatch-msg.sample      pre-applypatch.sample    pre-receive.sample
commit-msg.sample          pre-commit.sample        prepare-commit-msg.sample
fsmonitor-watchman.sample  pre-merge-commit.sample  push-to-checkout.sample
post-update                pre-push.sample          sendemail-validate.sample
post-update.sample         pre-rebase.sample        update.sample
[natasha@ststor01 hooks]$ ls -lah post-update
-rwxr-xr-x 1 natasha natasha 168 Dec 17 22:32 post-update
[natasha@ststor01 hooks]$ cd
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/cluster
[natasha@ststor01 cluster]$ git push origin master
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/cluster.git
   6a4e923..dde2e88  master -> master
[natasha@ststor01 cluster]$ cd
[natasha@ststor01 ~]$ cd /opt/cluster.git
[natasha@ststor01 cluster.git]$ git tag
[natasha@ststor01 cluster.git]$ cd
[natasha@ststor01 ~]$ cd /opt/cluster.git/
[natasha@ststor01 cluster.git]$ git tag
[natasha@ststor01 cluster.git]$ cd
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/cluster
[natasha@ststor01 cluster]$ git push origin --tags
Everything up-to-date
[natasha@ststor01 cluster]$ cd
[natasha@ststor01 ~]$ cd /opt/cluster.git && git tag
[natasha@ststor01 cluster.git]$ ls
HEAD  branches  config  description  hooks  info  objects  refs
[natasha@ststor01 cluster.git]$ cd hooks/
[natasha@ststor01 hooks]$ vi update
[natasha@ststor01 hooks]$ chmod +x /opt/cluster.git/hooks/update
[natasha@ststor01 hooks]$ ls -lah /opt/cluster.git/hooks/update
-rwxr-xr-x 1 natasha natasha 173 Dec 17 22:36 /opt/cluster.git/hooks/update
[natasha@ststor01 hooks]$ cd
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/cluster
[natasha@ststor01 cluster]$ echo "trigger update hook" >> info.txt
[natasha@ststor01 cluster]$ git add info.txt
[natasha@ststor01 cluster]$ git commit -m "Trigger update hook"
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: empty ident name (for <natasha@ststor01.stratos.xfusioncorp.com>) not allowed
[natasha@ststor01 cluster]$ sudo !!
sudo git commit -m "Trigger update hook"

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for natasha: 
[master b6fce22] Trigger update hook
 1 file changed, 1 insertion(+)
[natasha@ststor01 cluster]$ git push origin master
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 16 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 326 bytes | 326.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/cluster.git
   dde2e88..b6fce22  master -> master
[natasha@ststor01 cluster]$ cd
[natasha@ststor01 ~]$ cd /opt/cluster.git
[natasha@ststor01 cluster.git]$ git tag
release-2025-12-17
[natasha@ststor01 cluster.git]$ 