output "InstanceId" {
  value = aws_instance.ec2-web.id
}

output "PublicIpAddress" {
  value = aws_instance.ec2-web.public_ip
}
