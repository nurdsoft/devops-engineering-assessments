output "InstanceId" {
  description = <<DESC
The private DNS name assigned to the instance. Can only be used inside the
Amazon EC2, and only available if you've enabled DNS hostnames for your VPC.
DESC
  value       = aws_instance.instance.private_dns
}

output "PublicIpAddress" {
  description = "The public IP of the EC2 instance."
  value       = aws_instance.instance.public_ip
}
