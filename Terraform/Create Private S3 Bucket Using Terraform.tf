As part of the data migration process, the Nautilus DevOps team is actively creating several S3 buckets on AWS using Terraform. They plan to utilize both private and public S3 buckets to store the relevant data. Given the ongoing migration of other infrastructure to AWS, it is logical to consolidate data storage within the AWS environment as well.

Create an S3 bucket using Terraform with the following details:

1) The name of the S3 bucket must be datacenter-s3-12042.

2) The S3 bucket must block all public access, making it a private bucket.

The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Notes:

Use Terraform to provision the S3 bucket.
Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.
Ensure the resources are created in the us-east-1 region.
The bucket must have block public access enabled to restrict any public access.


Solution - :

resource "aws_s3_bucket" "datacenter-s3-12042" {
  bucket = "datacenter-s3-12042"

  tags = {
    Name        = "datacenter-s3-12042"
  }
}

resource "aws_s3_bucket_acl" "datacenter-s3-12042" {
  bucket = aws_s3_bucket.datacenter-s3-12042.id
  acl    = "private"
}

Validate :-

aws s3api get-public-access-block --bucket datacenter-s3-12042