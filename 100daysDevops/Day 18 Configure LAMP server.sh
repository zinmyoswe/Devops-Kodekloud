

Solution:

ssh tony@stapp01
sudo su -

yum install -y httpd php php-mysqlnd php-cli php-common

curl localhost

systemctl enable --now httpd

#change default apache port 80 to 8088
vi /etc/httpd/conf/httpd.conf
/Listen 80
8088

systemctl restart httpd
curl localhost:8088

Please Do continue to stapp02 and stapp03

Application are ready in all web server. continue to do in DB server


ssh peter@stdb01
sudo su -

yum install -y mariadb-server

systemctl enable --now mariadb
systemctl status mariadb

#enter database server
mysql

CREATE DATABASE kodekloud_db3;
SHOW DATABASE;

#'@'%' mean connect from any server
CREATE USER 'kodekloud_top'@'%' IDENTIFIED BY 'B4zNgHA7Ya';

#give full access to user
GRANT ALL PRIVILEGES ON kodekloud_db3.* TO 'kodekloud_top'@'%';

FLUSH PRIVILEGES;

#check user has all access
SHOW GRANTS FOR 'kodekloud_top'@'%';

CHECK in all sever that user can access all web server.

curl localhost:8088