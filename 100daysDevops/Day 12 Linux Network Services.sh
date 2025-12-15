Our monitoring tool has reported an issue in Stratos Datacenter. One of our app servers has an issue, as its Apache service is not reachable on port 5004 (which is the Apache port). The service itself could be down, the firewall could be at fault, or something else could be causing the issue.



Use tools like telnet, netstat, etc. to find and fix the issue. Also make sure Apache is reachable from the jump host without compromising any security settings.

Once fixed, you can test the same using command curl http://stapp01:5004 command from jump host.

Note: Please do not try to alter the existing index.html code, as it will lead to task failure.

Solution:

curl http://stapp01:5004

telnet stapp01 5004

ssh tony@stapp01
sudo su -
systemctl status httpd

#check who is using that port
netstat --help

#t is tcp, u is udp,l is list n is portno, p is program
neststat -tulnp | grep 5004

# stop sendmail as one port cannot handle two serice
systemctl status sendmail
systemctl stop sendmail
systemctl disable sendmail


systemctl start httpd
systemctl status httpd
systemctl enable httpd

curl http://stapp01:5004

neststat -tulnp | grep 5004

#firewall is block ip
#check in IP table
iptables --help
iptables -L -n --line-numbers

#put rule before line no 4 Reject
sudo iptables -I INPUT 4 -p tcp --dport 5004 -j ACCEPT


#fix telnet cannot call that server on jumphost
Test on jumphost

telnet stapp01 5004
curl http://stapp01:5004

#after fixing firewall tcp port it can run on jumphost
telnet stapp01 5004
curl http://stapp01:5004