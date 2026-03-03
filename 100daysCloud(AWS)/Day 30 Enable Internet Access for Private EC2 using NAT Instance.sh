The Nautilus DevOps team is tasked with enabling internet access for an EC2 instance running in a private subnet. This instance should be able to upload a test file to a public S3 bucket once it can access the internet. To minimize costs, the team has decided to use a NAT Instance instead of a NAT Gateway.

The following components already exist in the environment:
1) A VPC named xfusion-priv-vpc and a private subnet named xfusion-priv-subnet have been created.
2) An EC2 instance named xfusion-priv-ec2 is already running in the private subnet.
3) The EC2 instance is configured with a cron job that uploads a test file to the S3 bucket xfusion-nat-27294 every minute. Upload will only succeed once internet access is established.

Your task is to:

Create a new public subnet named xfusion-pub-subnet in the existing VPC.
Launch a NAT Instance in the public subnet using an Amazon Linux 2 AMI and name it xfusion-nat-instance. Configure this instance to act as a NAT instance. Make sure to use a custom security group for this instance.
After the configuration, verify that the test file xfusion-test.txt appears in the S3 bucket xfusion-nat-27294. This indicates successful internet access from the private EC2 instance via the NAT Instance.



Note:

-EC2 is running in a private subnet
- upload to S3 need internet access
- to reduce cost use NAT instance instead of use NAT Gateway

1. already have VPC and private subnet
2. EC2 is running in private subnet
3. a cron job in every minutes, will success when internet access

task
- Create public subnet in existing vpc
- launch NAT instance in public subnet use Amazon Linux2 AMI
- Configure that  instance to work NAT instance
- .txt file has in S3 bucket after configure

Solution

Search > VPC> private vpc> show subnet ip

#create public subnet
subnet > create > choose private vpc > subnet CIDR 10.1.2.0/24 + subnetname > create

# assign this subnet public ip
choose recent created subnet > actions> edit subnet setting > enable auto assign public IP > save

# it is need to create internet gateway to route public and public subnet under private vpc to internet
internet Gateway > create > name = xfusion-igw > create > actions > attach to VPC > private vpc > attach

# configure to use route table with internet gateway
private vpc > resource map > click route table that connect with pub-subnet > tags > add new tag > name + pub-rt > save
> edit route > add route > 0.0.0.0/0 + internet Gateway + xfusion-igw (recent create internet Gateway)

#now pub subnet is cross pub-rt to network connection via internet Gateway
private vpc > resource map

#create EC2 NAT
EC2 > create > name => nat instance name + browse more AMI (search=> Amazon Linux => AWS Marketplace => select=> subsribe on instance launch)
> t3.micro + no key pair + private pvc + pub subnet + create security group + xfusion-nat-sg + security group rule2 (all traffic) + source (10.1.0.0/16) > launch

#need to Configure NI to use NAT EC2 
EC2 > recent created NAT > network interface > choose > change source/destination check > disable > save


G=>create nat using iptables
https://www.revsys.com/writings/quicktips/nat.html

#NAT service configure
EC2 > recent created NAT > connect >

#check ip forward is work or not (sysctl)
sysctl net.ipv4.ip_forward


#change 0 to 1
sudo sysctl -w net.ipv4.ip_forward=1

#iptables is congfiure
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

#iptables service is need to configure
sudo yum install -y iptables-services

sudo service iptables save
sudo systemctl enable --now iptables
sudo systemctl status iptables

sudo iptables -t nat -L -n -v

#need to configure to pass in vpc
vpc > private vpc > resource map > click xfusion-priv-rt > edit routes> 0.0.0.0/0 + instance + xfusion-nat-instance >save

# file is reach to S3 now
s3> click s3 name > xfusion-test.txt



