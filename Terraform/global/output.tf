output "public_ip" {
    value = module.demoinstance_ec2_module.public_ip
    sensitive = false
}

output "instance_id" {
    value = module.demoinstance_ec2_module.instance_id
}