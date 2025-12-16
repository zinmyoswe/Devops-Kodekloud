The production support team of xFusionCorp Industries has deployed some of the latest monitoring tools to keep an eye on every service, application, etc. running on the systems. One of the monitoring systems reported about Apache service unavailability on one of the app servers in Stratos DC.



Identify the faulty app host and fix the issue. Make sure Apache service is up and running on all app hosts. They might not have hosted any code yet on these servers, so you don’t need to worry if Apache isn’t serving any pages. Just make sure the service is up and running. Also, make sure Apache is running on port 5000 on all app servers.

Solution:

#check which server is down.
curl http://stapp01:5000
curl http://stapp02:5000
curl http://stapp03:5000

ssh tony@stapp01
sudo su -

#check apache service is run
systemctl status httpd
systemctl enable httpd

#it will show suggest command to check error
systemctl start httpd

# u is service
journalctl -xeu httpd

#found port config error
#find who is using this port
ss -tulnp | grey 5000

#sendmail service is using that port
systemctl stop sendmail
systemctl disable sendmail


systemctl start httpd
systemctl status httpd

curl http://stapp01:5000