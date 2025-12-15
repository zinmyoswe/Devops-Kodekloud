We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 3004 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:



1. Install iptables and all its dependencies on each app host.


2. Block incoming port 3004 on all apps for everyone except for LBR host.


3. Make sure the rules remain, even after system reboot.

Solution:

ssh tony@stapp01
sudo su -

yum install -y iptables-services

systemctl enable --now iptables
systemctl status iptables

#clean default rules in iptables
iptables -F

#create Rule
sudo iptables -A INPUT -i lo -j ACCEPT

# out and income connection accept
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#receive or enter from ssh
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#accept from LBR Host LoadBalancer WAS
sudo iptables -A INPUT -p tcp -s 172.16.238.14 --dport 3004 -j ACCEPT

#Block port from 3004
sudo iptables -A INPUT -p tcp --dport 3004 -j DROP

#check all rules that created
sudo iptables -L -n --line-numbers

#save rules iptables remain after restart
sudo service iptables save
systemctl restart iptables

#check rule change or not
sudo iptables -L -n --line-numbers

Do it on all server stapp02 and stapp03



