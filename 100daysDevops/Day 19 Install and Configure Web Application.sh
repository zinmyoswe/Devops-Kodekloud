xFusionCorp Industries is planning to host two static websites on their infra in Stratos Datacenter. The development of these websites is still in-progress, but we want to get the servers ready. Please perform the following steps to accomplish the task:



a. Install httpd package and dependencies on app server 3.


b. Apache should serve on port 3004.


c. There are two websites backups /home/thor/blog and /home/thor/games on jump_host. Set them up on Apache in a way that blog should work on the link http://localhost:3004/blog/ and games should work on link http://localhost:3004/games/ on the mentioned app server.


d. Once configured you should be able to access the website using curl command on the respective app server, i.e curl http://localhost:3004/blog/ and curl http://localhost:3004/games/

Solution:

ls -lah
ls -lah blog/
ls -lah games/

cat blog/index.html

ls
scp -r blog/ banner@stapp03:~/
scp -r game/ banner@stapp03:~/

ssh banner@stapp03
sudo su -

yun install -y httpd
systemctl enable --now httpd

curl localhost

vi /etc/httpd/config/httpd.conf
/Listen 80
3004
#it has to move deploy app to below dir
/DocumentRoot

systemctl restart httpd

ls -lah /var/www/

#move two app to that dir
mv blog/ games/ /var/www/html/
ls /var/www/html/

curl http://localhost:3004/blog/ 
curl http://localhost:3004/games/