Day 3 Secure Root SSH Access

Following security audits, the xFusionCorp Industries security team has rolled out new protocols, including the restriction of direct root SSH login.

Your task is to disable direct SSH root login on all app servers within the Stratos Datacenter.

Solution:

Login to server

Example for app server 1:

ssh tony@stapp01

2️⃣ Open SSH config file
sudo vi /etc/ssh/sshd_config

3️⃣ Find this line

(It may be yes or commented)

#PermitRootLogin yes


Modify it to:

PermitRootLogin no

Restart SSH service

Ubuntu/Debian:

sudo systemctl restart ssh


CentOS/RHEL:

sudo systemctl restart sshd

Verification

Run:

ssh root@stapp01