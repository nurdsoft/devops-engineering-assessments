output "InstanceId" {
  value = aws_instance.ec2-nurdsoft-assesment.id
}

output "PublicIpAddress" {
  value = aws_instance.ec2-nurdsoft-assesment.public_ip
}