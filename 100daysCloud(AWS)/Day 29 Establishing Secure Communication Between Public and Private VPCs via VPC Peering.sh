The Nautilus DevOps team has been tasked with demonstrating the use of VPC Peering to enable communication between two VPCs. One VPC will be a private VPC that contains a private EC2 instance, while the other will be the default public VPC containing a publicly accessible EC2 instance.

1) There is already an existing EC2 instance in the public vpc/subnet:

Name: datacenter-public-ec2
2) There is already an existing Private VPC:

Name: datacenter-private-vpc
CIDR: 10.1.0.0/16
3) There is already an existing Subnet in datacenter-private-vpc:

Name: datacenter-private-subnet
CIDR: 10.1.1.0/24
4) There is already an existing EC2 instance in the private subnet:

Name: datacenter-private-ec2
5) Create a Peering Connection between the Default VPC and the Private VPC:

VPC Peering Connection Name: datacenter-vpc-peering
6) Configure Route Tables to enable communication between the two VPCs.

Ensure the private EC2 instance is accessible from the public EC2 instance.
7) Test the Connection:

Add /root/.ssh/id_rsa.pub public key to the public EC2 instance's ec2-user's authorized_keys to make sure we are able to ssh into this instance from AWS client host. You may also need to update the security group of the private EC2 instance to allow ICMP traffic from the public/default VPC CIDR. This will enable you to ping the private instance from the public instance.
SSH into the public EC2 instance and ensure that you can ping the private EC2 instance.

Note:
1. already have EC2 in public vpc/subnet
2. already have private VPC - CIDR 10.1.0.0/16
3. already have subnet in private VPC
4. EC2 instance is in private subnet

#Task that we do
5. Peering default vpc and private vpc
6. configure Route tables between two VPCs
7. test connection
 - add ssh key to public key
 - ssh into EC2
 - allow port to ping
 
 
Solution:
#request default vpc to private vpc
VPC > Peering Connection > Peering name + request(default vpc) + accept(private vpc) > create peering connection

#become link between two vpc
choose recent create Peering> actions > accept

#link between private vpc route table and default vpc route table

#edit private vpc route table
route tables> choose private vpc route table > edit routes > add > default vpc ip + choose peering connection recent created > save
route tables> choose default vpc route table > edit routes > add > private vpc ip + choose peering connection recent created > save

#now two of route are linked

# test connection network reachable private and public EC2
Search > Reachabilibility Analyzer > create analyze path > test-peering + path source (test  instances + from public ec2) + path source (test  instances + to private ec2)
+ source port(22) + destination port(22) > create

#edit inbound rule of public EC2 enter into ssh
EC2 > public EC2 > security > default security > add rule > ssh + anywhere > save 

Local Terminal > cat /root/.ssh/id_rsa.pub > copy the key

#can enter ec2 ssh connect now and add public key
ec2 > connect > vi .ssh/authorized_keys > paste the key from local 

#check public key is added or Not
Local Terminal > ls cat/root/.ssh
# test public EC2 can ssh enter
Local Terminal > ssh ec2-user@[public ip of EC2]

#ping private EC2 IP and cannot ping
Local Terminal > ping [private ip of EC2]

#open ICMP to ping in security
private EC2 > security > choose > edit inbound > add rule > All ICMP -IPv4 + source come from default vpc ip 172 > create

#test ping again
Local Terminal > ping [private ip of EC2]