
Day 7 Linux SSH Authentication

The system admins team of xFusionCorp Industries has set up some scripts on jump host that run on regular intervals and perform operations on all app servers in Stratos Datacenter. To make these scripts work properly we need to make sure the thor user on jump host has password-less SSH access to all app servers through their respective sudo users (i.e tony for app server 1). Based on the requirements, perform the following:



Set up a password-less authentication from user thor on jump host to all app servers through their respective sudo users.

Solution:

Step 1: Login to jump host and switch to thor
sudo su - thor

✔ Step 2: Generate SSH Key (press ENTER for all)
ssh-keygen -t rsa

ls -lah

ssh-copy-id tony@stapp01
ssh-copy-id steve@stapp02
ssh-copy-id banner@stapp03


Step 3: Test Password-less Login withoud password
Test each server
ssh tony@app01
exit

ssh steve@app02
exit

ssh banner@app03
exit