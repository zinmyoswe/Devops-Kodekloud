The Nautilus DevOps team has been creating a couple of services on AWS cloud. They have been breaking down the migration into smaller tasks, allowing for better control, risk mitigation, and optimization of resources throughout the migration process. Recently they came up with requirements mentioned below.

An IAM user named iamuser_siva and a policy named iampolicy_siva already exists. Use Terraform to attach the IAM policy iampolicy_siva to the IAM user iamuser_siva. The Terraform working directory is /home/bob/terraform. Update the main.tf file (do not create a separate .tf file) to attach the specified IAM policy to the IAM user.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Solution:

# Create IAM user
resource "aws_iam_user" "user" {
  name = "iamuser_siva"

  tags = {
    Name = "iamuser_siva"
  }
}

# Create IAM Policy
resource "aws_iam_policy" "policy" {
  name        = "iampolicy_siva"
  description = "IAM policy allowing EC2 read actions for siva"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:Read*"]
        Resource = "*"
      }
    ]
  })
}

# ✅ Attach IAM Policy to IAM User
resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}