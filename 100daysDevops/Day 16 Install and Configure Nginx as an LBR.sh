
Solution:

ssh loki@stlb01

sudo su -

yum install -y nginx

#check apache is running which port on all server
Login app server 1

#check apache service port
ss -tulnp | grep httpd

#can see now 8086 port run for httpd
curl localhost:8086
exit

#we can see all of servers are running this port
Test in Jumhost
curl stapp01:8086
curl stapp02:8086
curl stapp03:8086

systemctl enable --now nginx

can open app now

Go to Google=> nginx documentation load balancing
https://docs.nginx.com/nginx/admin-guide/load-balancer/http-load-balancer/

#copy from that website and edit

http {
    upstream stapp {
        server stapp01:8086;
        server stapp02:8086;
        server stapp03:8086;
    }
	server {
		location / {
			proxy_pass http://stapp;
		}
	}
}

#put upstream above server. both are under conf
vi /etc/nginx/nginx.conf

#check config is ok
nginx -t

#service reload
nginx -s reload