The Nautilus DevOps team is automating IAM policy creation using Terraform to enhance security and access management. As part of this task, they need to create an IAM policy with specific requirements.

For this task, create an AWS IAM policy using Terraform with the following requirements:

The IAM policy name iampolicy_rose should be stored in a variable named KKE_iampolicy.
Note:

The configuration values should be stored in a variables.tf file.

The Terraform script should be structured with a main.tf file referencing variables.tf.

The Terraform working directory is /home/bob/terraform.

Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.


Solution:


variables.tf
variable "KKE_iampolicy" {
  description = "IAM Policy name"
  type        = string
  default     = "iampolicy_rose"
}

variable "KKE_policy_document" {
  description = "IAM Policy JSON document"
  type        = string
  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}


main.tf
resource "aws_iam_policy" "kke_policy" {
  name   = var.KKE_iampolicy
  policy = var.KKE_policy_document
}

terraform init
terraform plan
terraform apply