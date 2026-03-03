
1. create EC2 instance use Ubuntu AMI
2. Create CloudWatch Alarm

Solution:

#create EC2 instance
EC2 >Create new instance > instance name + choose Ubuntu + default VPC and security group > Launch instance

@step1
#create CloudWatch alarm
copy of EC2 instanceId
search >CloudWatch > Alarm > All Alarm > Create > Select Metric > choose EC2 > Per instance Metric (watching one instance)
> paste our recent created EC2 instance> choose CPU Utilization > click select metric

#now can see CPU metric Graph


@step2
#send notification to SMS topic
choose already created sms topic in send a notification to... > Next

@step3
#Add Alarm Name
Fill Alarm Name > Next 
Create Alarm


