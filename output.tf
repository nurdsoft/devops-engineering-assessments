# DISPLAY INSTANCE ID
output "InstanceId" {
  value = aws_instance.ec2-web.id
}

# DISPLAY PUBLIC ADDRESS
output "PublicIpAddress" {
  value = aws_instance.ec2-web.public_ip
}
