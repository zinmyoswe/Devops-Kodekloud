
The Nautilus DevOps team is enhancing infrastructure automation and needs to provision a Security Group using Terraform with specific configurations.

For this task, create an AWS Security Group using Terraform with the following requirements:

The Security Group name devops-sg should be stored in a variable named KKE_sg.
Note:

1. The configuration values should be stored in a variables.tf file.

2. The Terraform script should be structured with a main.tf file referencing variables.tf.
The Terraform working directory is /home/bob/terraform.

Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.


Solution:

variable.tf

variable "KKE_sg" {
  description = "Name of the security group"
  type        = string
  default     = "devops-sg"
}

main.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "this" {
  name        = var.KKE_sg
  description = "Security group created using Terraform"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.KKE_sg
  }
}


terraform init
terraform plan
terraform apply