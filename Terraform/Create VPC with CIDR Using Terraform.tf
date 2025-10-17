The Nautilus DevOps team is strategically planning the migration of a portion of their infrastructure to the AWS cloud. Acknowledging the magnitude of this endeavor, they have chosen to tackle the migration incrementally rather than as a single, massive transition. Their approach involves creating Virtual Private Clouds (VPCs) as the initial step, as they will be provisioning various services under different VPCs.

Create a VPC named devops-vpc in us-east-1 region with 192.168.0.0/24 IPv4 CIDR using terraform.


The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Solution ----

resource "aws_vpc" "devops-vpc" {
  cidr_block                       = "192.168.0.0/24"
  
  tags = {
    Name = "devops-vpc"
  }
}