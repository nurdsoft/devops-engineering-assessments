output "InstanceId" {
  value = aws_instance.this.id
}

output "PublicIpAddress" {
  value = aws_instance.this.public_ip
}
