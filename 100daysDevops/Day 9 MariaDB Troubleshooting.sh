There is a critical issue going on with the Nautilus application in Stratos DC. 
The production support team identified that the application is unable to connect to the database.
After digging into the issue, the team found that mariadb service is down on the database server.



Look into the issue and fix the same.

Solution:

ssh peter@stdb01

sudo su-

#check db server is up
sudo mysql

#check marinadb is stop
systemctl status marinadb

#get the problem why cannot start
systemctl start marinadb

#debugging
sudo copy of problem

#problem
/var/lib/mysql is empty

#check
ls -lah /var/lib/mysql

#build dir
mkdir /var/lib/mysql
ls -lah /var/lib/mysql

#make mysql user Read write acess
sudo chown -R mysql:mysql /var/lib/mysql

systemctl start marinadb
systemctl status marinadb
sudo mysql
show databases;
