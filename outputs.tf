# Output the public IP of the EC2 instance
output "ec2_public_ip" {
  value       = aws_instance.example.public_ip
  description = "Public IP address of the EC2 instance"
}

# Output the ID of the created EBS volume
output "ebs_volume_id" {
  value       = aws_ebs_volume.example.id
  description = "ID of the created EBS volume"
}

# Output the ID of the volume attachment
output "attachment_status" {
  value       = aws_volume_attachment.example.id
  description = "ID of the volume attachment"
}
