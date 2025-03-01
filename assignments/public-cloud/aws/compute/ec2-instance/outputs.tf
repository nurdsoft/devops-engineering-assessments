
output "vpc_id" {
  description = "Vpc id"
  value       = aws_vpc.test_vpc.id
}

output "subnet_id" {
  description = "Subnet id"
  value       = aws_subnet.test_subnet.id
}

output "instance_id" {
  description = "EC2 instance id"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Public ip address"
  value       = aws_instance.this.public_ip
}
