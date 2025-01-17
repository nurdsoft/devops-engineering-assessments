output "InstanceId" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.linux_instance.id
}

output "PublicIpAddress" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.linux_instance.public_ip
}
