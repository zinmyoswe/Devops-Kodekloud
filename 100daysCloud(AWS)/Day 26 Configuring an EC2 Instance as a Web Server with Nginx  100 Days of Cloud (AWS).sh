
1. EC2 instance create
2. Ubuntu AMI
3. User Data Script configure
4. Security group port 80

EC2 > create > security group + allow HTTP traffic from the internet

Advanced > User data script

#!/bin/bash
echo "User Data Start" > /tmp/user-data-status
apt update
apt install -y nginx
systemctl enable nginx
systemctl start nginx
echo "User Data Done" >> /tmp/user-data-status

Launch

instance > connect > 
ls /tmp
tail -f /tmp/user-data-status

#check nginx service is work or not
curl localhost

#port 80 is work or not
copy pubic ip of instance > run in browser http
