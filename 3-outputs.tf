output "InstanceId" {
  description = "The ID of the instance"
  value       = aws_instance.nurdsoft_ec2.id
}

output "PublicIpAddress" {
  description = "value of the public ip address"
  value       = aws_instance.nurdsoft_ec2.public_ip
}