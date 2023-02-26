output "PublicIpAddress" {
  value = aws_instance.FirstInstance.public_ip
}
output "InstanceId" {
    value = aws_instance.FirstInstance.id 
}
