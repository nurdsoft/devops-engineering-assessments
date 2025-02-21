output "InstanceId" {
  value = aws_instance.example_ec2.id
}

output "PublicIpAddress" {
  value = aws_instance.example_ec2.public_ip
}