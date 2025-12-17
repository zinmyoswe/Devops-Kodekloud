The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/blog present on Storage server in Stratos DC. One of the developers stashed some in-progress changes in this repository, but now they want to restore some of the stashed changes. Find below more details to accomplish this task:



Look for the stashed changes under /usr/src/kodekloudrepos/blog git repository, and restore the stash with stash@{1} identifier. Further, commit and push your changes to the origin.

Solution:

ssh natasha@ststor01
sudo su -

cd /usr/src/kodekloudrepos/blog
ls
git status

vi new.txt
git add new.txt
git status

#new.txt are store in git stash
git stash save "temp save"

git status

#to view git stash  list
git stash list

#draw out specified no from git list
git stash pop stash@{0}

git stash list

git restore --staged new.txt
git status
rm new.txt

---------------
git stash list
git stash apply stash@{1}
git status
git commit -m "apply stash@{1}"
git push


