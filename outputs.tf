output "id" {
  description = "The ID of the instance"
  value       = aws_instance.example_instance.id
}

output "public_ip" {
  description = "The public IP address assigned to the instance"
  value       = aws_instance.example_instance.public_ip
}