The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 2 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:



1. Install and configure nginx on App Server 2.


2. On App Server 2 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.


3. Create an index.html file with content Welcome! under Nginx document root.


4. For final testing try to access the App Server 2 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.

Solution:

ssh steve@stapp02
sudo su -

yum install -y nginx

systemctl enable --now nginx
systemctl status nginx

curl https://localhost

ls -lah /etc/nginx/

#create apporitate dir
mkdir /etc/nginx/ssl

#move natilus file to that dir
mv /tmp/nautilus.* /etc/nginx/ssl

ls -lah /etc/nginx/ssl

#give keyfile to some permisson only root can read and write
chmod 600 /etc/nginx/ssl/nautilus.key

ls -lah /etc/nginx/ssl

#check why config file are place
cat /etc/nginx/nginx.conf 

touch /etc/nginx/conf.d/natilus.conf

copy that are close command in "cat /etc/nginx/nginx.conf"

server {
    listen       443 ssl http2;
    listen       [::]:443 ssl http2;
    server_name  _;
    root         /usr/share/nginx/html;

    ssl_certificate "/etc/nginx/ssl/nautilus.crt";
    ssl_certificate_key "/etc/nginx/ssl/nautilus.key";
    
	index index.html index.htm;
	
	location / {
		try_files $uri $uri/ = 404;
	}
}

#copy that file to below
vi /etc/nginx/conf.d/nautilus.conf

#check config is correct
sudo nginx -t

#service reload
nginx -s reload

systemctl restart nginx
systemctl status nginx

curl https://localhost
curl --insecure https://localhost

#to edit html file
vi /usr/share/nginx/html/index.html
:%d
Paste Welcome!

curl --insecure https://localhost

#In Jumphost test
curl --insecure https://stapp02

curl -Ik https://172.16.238.11