The Nautilus DevOps team wants to provision multiple EC2 instances in AWS using Terraform. Each instance should follow a consistent naming convention and be deployed using a modular and scalable setup.

Use Terraform to:

Create 3 EC2 instances using the count parameter.

Name each EC2 instance with the prefix datacenter-instance (e.g., datacenter-instance-1).

Instances should be t2.micro.

The key named should be datacenter-key.

Create main.tf file (do not create a separate .tf file) to provision these instances.

Use variables.tf file with the following:

KKE_INSTANCE_COUNT: number of instances.
KKE_INSTANCE_TYPE: type of the instance.
KKE_KEY_NAME: name of key used.
KKE_INSTANCE_PREFIX: name of the instnace.
Use the locals.tf file to define a local variable named AMI_ID that retrieves the latest Amazon Linux 2 AMI using a data source.

Use terraform.tfvars to assign values to the variables.

Use outputs.tf file to output the following:

kke_instance_names: names of the instances created.

Notes:

The Terraform working directory is /home/bob/terraform.

Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Before submitting the task, ensure that terraform plan returns No changes. Your infrastructure matches the configuration.


Solution:


main.tf
# Retrieve latest Amazon Linux 2 AMI (use locals for the final ID)
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "datacenter" {
  count         = var.KKE_INSTANCE_COUNT
  ami           = local.AMI_ID
  instance_type = var.KKE_INSTANCE_TYPE
  key_name      = var.KKE_KEY_NAME

  tags = {
    Name = "${var.KKE_INSTANCE_PREFIX}-${count.index + 1}"
  }
}

variables.tf
variable "KKE_INSTANCE_COUNT" {
  type = number
}

variable "KKE_INSTANCE_TYPE" {
  type = string
}

variable "KKE_KEY_NAME" {
  type = string
}

variable "KKE_INSTANCE_PREFIX" {
  type = string
}


locals.tf
locals {
  AMI_ID = data.aws_ami.amazon_linux.id
}

terraform.tfvars
KKE_INSTANCE_COUNT  = 3
KKE_INSTANCE_TYPE   = "t2.micro"
KKE_KEY_NAME        = "datacenter-key"
KKE_INSTANCE_PREFIX = "datacenter-instance"

outputs.tf
output "kke_instance_names" {
  value = [
    for i in aws_instance.datacenter :
    i.tags.Name
  ]
}


1. Initialize
terraform init

2. Preview changes
terraform plan

3. Apply changes
terraform apply

4. Check output
terraform output kke_instance_names