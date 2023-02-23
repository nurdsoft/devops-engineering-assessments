output "my_instance_instance_id" {
  value = aws_instance.my_instance.id
}
output "my_instance_public_ip_address" {
  value = aws_instance.my_instance.public_ip
}
output "my_vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "my_subnet_id" {
  value = aws_subnet.my_subnet.id
}
