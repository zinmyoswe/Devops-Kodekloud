The Nautilus DevOps Team has received a request from the Networking Team to set up a new public VPC to support a set of public-facing services. This VPC will host various resources that need to be accessible over the internet. As part of this setup, you need to ensure the VPC has public subnets with automatic IP assignment for resources. Additionally, a new EC2 instance will be launched within this VPC to host public applications that require SSH access. This setup will enable the Networking Team to deploy and manage public-facing applications.

Create a public VPC named nautilus-pub-vpc, and a subnet named nautilus-pub-subnet under the same, make sure public IP is being auto assigned to resources under this subnet. Further, create an EC2 instance named nautilus-pub-ec2 under this VPC with instance type t2.micro. Make sure SSH port 22 is open for this instance and accessible over the internet.


Use below given AWS Credentials: (You can run the showcreds command on aws-client host to retrieve these credentials)


#Note

1. create VPN
2. create subnet under that VPC and IP auto assign
3. create EC2 instance under that VPC + instance t2.micro
4. SSH port 22 can open over the internet

Solution
#create VPC
Search > VPC > create VPC > choose VPC only + VPCname
+ IPV4 CIDR manual input + 10.0.0.0/16 > create VPC

#create subnet
subnet > create > choose recent create VPC + subnetname + IPV4 subnet CIDR block ( 10.0.1.0/24 ) >create

#Enable IP auto assign
created recent subnet > actions > edit subnet setting + Enable auto-assign public IPV4 address > save

#create internet gateway

internet gateway > create internet gateway > name(pub-igw) > create

#attach ig with vpc
created recent internet gateway > actions > attach to vpc > choose created vpc name > attach

#edit route table to connect with network and pass
route tables > routes > edit route > 0.0.0.0/0 + internet gateway + choose recent created internet gateway > save

#create EC2 instance
create > choose recent created VPC + t2.micro

#check security group of EC2 is connect with 22
EC2 > connect

