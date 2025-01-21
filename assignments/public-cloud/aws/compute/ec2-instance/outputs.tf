output "InstanceId" {
  description = "The unique ID of the created EC2 instance."
  value       = aws_instance.linux_ec2.id
}

output "PublicIpAddress" {
  description = "The publicly accessible IP address of the instance."
  value       = aws_instance.linux_ec2.public_ip
}