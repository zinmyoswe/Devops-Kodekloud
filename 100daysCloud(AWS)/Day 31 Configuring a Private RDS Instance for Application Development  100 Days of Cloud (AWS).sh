The Nautilus Development Team is working on a new application feature that requires a reliable and scalable database solution. To facilitate development and testing, they need a new private RDS instance. This instance will be used to store critical application data and must be provisioned using the AWS free tier to minimize costs during the initial development phase. The team has chosen MySQL as the database engine due to its compatibility with their existing systems. The DevOps team has been tasked with setting up this RDS instance, ensuring that it is correctly configured and available for use by the development team.

As a member of the Nautilus DevOps Team, your task is to perform the following:

Provision a Private RDS Instance: Create a new private RDS instance named xfusion-rds using a sandbox template, further it must be a db.t3.micro type instance.
Engine Configuration: Use the MySQL engine with version 8.4.x.
Enable Storage Autoscaling: Enable storage autoscaling and set the threshold value to 50GB. Keep the rest of the configurations as default.
Instance Availability: Ensure the instance is in the available state before submitting this task.

Note:

1. create RDS instance, use sandbox template, size db.t3.micro
2. configure MYSQL ver 8.4.x
3. storage auto scaling and threshold limit 50GB
4. instance state available

Solution:

Search > RDS > Database > create> MYSQL + 8.4.x + free tier + single instance + RDS name + credential(self manage + auto password) + size db.t3.micro + storage type(gp3)
+ additional storage configuration 50 > create

view connection detail > copy master password

#Database create time is long and have to wait 3 stage

0B4n0Z557MXwLsZM9ZMc