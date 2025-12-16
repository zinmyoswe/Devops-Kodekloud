The Nautilus application development team is planning to launch a new PHP-based application, which they want to deploy on Nautilus infra in Stratos DC. The development team had a meeting with the production support team and they have shared some requirements regarding the infrastructure. Below are the requirements they shared:



a. Install nginx on app server 2 , configure it to use port 8093 and its document root should be /var/www/html.


b. Install php-fpm version 8.2 on app server 2, it must use the unix socket /var/run/php-fpm/default.sock (create the parent directories if dont exist).


c. Configure php-fpm and nginx to work together.


d. Once configured correctly, you can test the website using curl http://stapp02:8093/index.php command from jump host.

NOTE: We have copied two files, index.php and info.php, under /var/www/html as part of the PHP-based application setup. Please do not modify these files.
Solution:

ssh steve@stapp02
sudo su -

yum install -y nginx

systemctl enable --now nginx

vi /etc/nginx/nginx.conf
/listen 80
8093
#change dir
root /var/www/html

nginx -t
nginx -s reload

curl http://stapp02:8093/index.php

#Need to add php now

Google =>centos 9 stream install php 8.2



sudo dnf update -y
sudo dnf install -y epel-release
sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm
sudo dnf module reset php -y
sudo dnf module enable php:remi-8.2 -y

dnf install -y php php-fpm php-common

systemctl enable --now php-fpm

#change socket
vi /etc/php-fpm.d/www.conf
Change socket at listen

systemctl restart php-fpm
systemctl status php-fpm

curl http://stapp02:8093/index.php

#integrate nginx and php

Google=>nginx config php-fpm unix socket digitalocean
https://www.digitalocean.com/community/tutorials/php-fpm-nginx

		location ~ \.php$ {
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass unix:/var/run/php-fpm/default.sock;
            fastcgi_index index.php;
            include fastcgi.conf;
		}

sudo vi /etc/nginx/nginx.conf

nginx -t
nginx -s reload

#php is work now
curl http://stapp02:8093/index.php