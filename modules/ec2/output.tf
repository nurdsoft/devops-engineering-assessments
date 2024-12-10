output "instance_id" {
  value = aws_instance.ec2.id
  description = "The ID of the EC2 instance"
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
  description = "The public IP address of the EC2 instance"
}