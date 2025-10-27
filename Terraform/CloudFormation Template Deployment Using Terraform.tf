

The Nautilus DevOps team is working on automating infrastructure deployment using AWS CloudFormation. 
As part of this effort, they need to create a CloudFormation stack that provisions an S3 bucket with versioning enabled.

Create a CloudFormation stack named nautilus-stack using Terraform. This stack should contain an S3 bucket named nautilus-bucket-15390 as a resource,
 and the bucket must have versioning enabled. The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Solution:

resource "aws_cloudformation_stack" "nautilus_cf_stack" {
  # The name required by the prompt
  name = "nautilus-stack"

  # Define the CloudFormation template inline
  template_body = <<EOF
{
  "AWSTemplateFormatVersion": "2010-09-09",
  "Description": "CloudFormation stack to create an S3 bucket with versioning.",
  "Resources": {
    "NautilusS3Bucket": {
      "Type": "AWS::S3::Bucket",
      "Properties": {
        "BucketName": "nautilus-bucket-15390",
        "VersioningConfiguration": {
          "Status": "Enabled"
        }
      }
    }
  }
}
EOF
}