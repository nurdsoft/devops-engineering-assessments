output "InstanceId" {
  description = "ID of the newly created instance"
  value       = aws_instance.instance.private_dns
}

output "PublicIpAddress" {
  description = "The public ip for ssh access"
  value       = aws_instance.instance.public_ip
}