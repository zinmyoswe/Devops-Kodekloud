The Nautilus DevOps team has some volumes in different regions in their AWS account. They are going to setup some automated backups so that all important data can be backed up on regular basis. For now they shared some requirements to take a snapshot of one of the volumes they have.

Create a snapshot of an existing volume named devops-vol in us-east-1 region using terraform.

1) The name of the snapshot must be devops-vol-ss.

2) The description must be Devops Snapshot.

3) Make sure the snapshot status is completed before submitting the task.

The Terraform working directory is /home/bob/terraform. Update the main.tf file (do not create a separate .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Solution:

resource "aws_ebs_snapshot" "devops-vol-ss" {
  description = "Devops Snapshot"
  volume_id = aws_ebs_volume.k8s_volume.id

  tags = {
    Name = "devops-vol-ss"
  }
}

output "snapshot_id" {
  value       = aws_ebs_snapshot.devops-vol-ss.id
  description = "The ID of snapshot."
}


------------------------------------ fixing on existing volume --------------------------


resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "xfusion-vol"
  }
}

resource "aws_ebs_snapshot" "xfusion-vol-ss" {
  description = "Xfusion Snapshot"
  volume_id = aws_ebs_volume.k8s_volume.id

  tags = {
    Name = "xfusion-vol-ss"
  }
}

output "snapshot_id" {
  value       = aws_ebs_snapshot.xfusion-vol-ss.id
  description = "The ID of snapshot."
}