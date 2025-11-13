The Nautilus DevOps team is presently immersed in data migrations, transferring data from on-premise storage systems to AWS S3 buckets. They have recently received some data that they intend to copy to one of the S3 buckets.

S3 bucket named xfusion-cp-19079 already exists. Copy the file /tmp/xfusion.txt to s3 bucket xfusion-cp-19079 using Terraform. The Terraform working directory is /home/bob/terraform. Update the main.tf file (do not create a separate .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Solution:

main.tf

resource "aws_s3_bucket" "my_bucket" {
  bucket = "xfusion-cp-19079"
  acl    = "private"

  tags = {
    Name        = "xfusion-cp-19079"
  }
}

# Copy local file to existing S3 bucket
resource "null_resource" "copy_file_to_s3" {
  provisioner "local-exec" {
    command = "aws s3 cp /tmp/xfusion.txt s3://${aws_s3_bucket.my_bucket.bucket}/"
  }
}

terraform init
terraform plan
terraform apply

validation
aws s3 ls s3://xfusion-cp-19079/