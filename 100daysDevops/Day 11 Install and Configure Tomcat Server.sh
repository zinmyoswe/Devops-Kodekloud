The Nautilus application development team recently finished the beta version of one of their Java-based applications, which they are planning to deploy on one of the app servers in Stratos DC. After an internal team meeting, they have decided to use the tomcat application server. Based on the requirements mentioned below complete the task:



a. Install tomcat server on App Server 2.

b. Configure it to run on port 3003.

c. There is a ROOT.war file on Jump host at location /tmp.


Deploy it on this tomcat server and make sure the webpage works directly on base URL i.e curl http://stapp02:3003

Solution:

#copy file to app server 2
scp /tmp/Root.war steve@stapp02:~/

ssh steve@stapp02
sudo su -
ls

#install tomcat
sudo yum install tomcat

#edit port
vi /etc/tomcat/server.xml

#8080 is default and searh port
/8080
change 8080 to 3003

:wq!

systemctl status tomcat

#enable and start together
systemctl enable --now tomcat

curl stapp02:3003

#deploy on webapps

ls -lah /usr/share/tomcat
ls -lah /usr/share/tomcat/webapps
mv Root.war /usr/share/tomcat/webapps



#check Root.war content
ls -lah /usr/share/tomcat/webapps/Root

#after moving web service is work now
curl http://stapp02:3003




