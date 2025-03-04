#this file contains two outputs: InstanceId and PublicIpAddress
output "InstanceId" {
  description = "The ID of the instance"
  value = aws_instance.example.id
}

output "PublicIpAddress" {
  description = "The public IP address assigned to the instance, if applicable."
  value = aws_instance.example.public_ip
}