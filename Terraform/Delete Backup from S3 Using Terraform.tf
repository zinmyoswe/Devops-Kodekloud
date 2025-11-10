The Nautilus DevOps team is currently engaged in a cleanup process, focusing on removing unnecessary data and services from their AWS account. As part of the migration process, several resources were created for one-time use only, necessitating a cleanup effort to optimize their AWS environment.

A S3 bucket named datacenter-bck-6423 already exists.

1) Copy the contents of datacenter-bck-6423 S3 bucket to /opt/s3-backup/ directory on terraform-client host (the landing host once you load this lab).

2) Delete the S3 bucket datacenter-bck-6423.

3) Use the AWS CLI through Terraform to accomplish this task—for example, by running AWS CLI commands within Terraform. The Terraform working directory is /home/bob/terraform. Update the main.tf file (do not create a separate .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Solution:

main.tf

resource "null_resource" "backup_and_delete_s3" {
  provisioner "local-exec" {
    command = <<EOT
      # Step 1: Copy S3 bucket contents to local directory
      aws s3 cp s3://datacenter-bck-6423 /opt/s3-backup/ --recursive

      # Step 2: Delete the S3 bucket after backup
      aws s3 rb s3://datacenter-bck-6423 --force
    EOT
  }
}


terraform init
terraform plan
terraform apply
