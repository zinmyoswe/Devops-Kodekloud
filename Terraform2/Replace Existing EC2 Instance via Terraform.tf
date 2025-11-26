To test resilience and recreation behavior in Terraform, the DevOps team needs to demonstrate the use of the -replace option to forcefully recreate an EC2 instance without changing its configuration. Please complete the following tasks:

Use the Terraform CLI -replace option to destroy and recreate the EC2 instance nautilus-ec2, even though the configuration remains unchanged.

Ensure that the instance is recreated successfully.


Notes:

The new instance created using the -replace option should have a different instance ID than the previously provisioned instance.

The Terraform working directory is /home/bob/terraform.

Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Before submitting the task, ensure that terraform plan returns No changes. Your infrastructure matches the configuration.

Solution:

check current main.tf

resource "aws_instance" "web_server" { ami = var.ami_id instance_type = var.instance_type tags = { Name = var.instance_name } }



terraform apply -replace="aws_instance.web_server"

validation:

terraform plan

No changes. Your infrastructure matches the configuration.