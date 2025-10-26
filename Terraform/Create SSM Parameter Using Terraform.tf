The Nautilus DevOps team needs to create an SSM parameter in AWS with the following requirements:

1) The name of the parameter should be devops-ssm-parameter.

2) Set the parameter type to String.

3) Set the parameter value to devops-value.

4) The parameter should be created in the us-east-1 region.

5) Ensure the parameter is successfully created using terraform and can be retrieved when the task is completed.

The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Solution:

resource "aws_ssm_parameter" "devops_parameter" {
  name  = "devops-ssm-parameter"
  type  = "String"
  value = "devops-value"
}

Validation:

aws ssm get-parameter --name "devops-ssm-parameter" --region us-east-1