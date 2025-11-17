
Day 1: Linux User Setup with Non-Interactive Shell

To accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-interactive shell. 
Here's your task:

Create a user named john with a non-interactive shell on App Server 2.

Solution:

ssh steve@stapp02
sudo su -

#nologin shell
sudo useradd -s /sbin/nologin john

Validation
grep john /etc/passwd