The Nautilus DevOps team is setting up monitoring in their AWS account. As part of this, they need to create a CloudWatch alarm.

Using Terraform, perform the following:

Task Details:
Create a CloudWatch alarm named xfusion-alarm.
The alarm should monitor CPU utilization of an EC2 instance.
Trigger the alarm when CPU utilization exceeds 80%.
Set the evaluation period to 5 minutes.
Use a single evaluation period.
Ensure that the entire configuration is implemented using Terraform. The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Solution:

resource "aws_cloudwatch_metric_alarm" "xfusion-alarm" {
  alarm_name                = "xfusion-alarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  period                    = 300        
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  statistic                 = "Average"
  threshold                 = 80
}


Validate:

aws cloudwatch describe-alarms --alarm-names xfusion-alarm
