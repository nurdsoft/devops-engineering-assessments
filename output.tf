output "EC2InstanceId" {
  description = "ID of instances"
  value       = aws_instance.ec2_instance.id
}

output "EC2PublicIpAddress" {
  description = "Public IP addresses assigned to the instances"
  value       = aws_instance.ec2_instance.public_ip
}
