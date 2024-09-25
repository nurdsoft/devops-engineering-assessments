output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.example.id
}

output "public_ip_address" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.example.public_ip
}

