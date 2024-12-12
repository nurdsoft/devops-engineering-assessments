output "instance_id" {
  description = "ID of the newly created instance"
  value       = module.ec2_instance.id
}

output "public_ip_address" {
  description = "publicly accessible ip address as an output"
  value       = module.ec2_instance.public_ip
}
