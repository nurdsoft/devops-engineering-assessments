variable "region" {
  description = "AWS region where the instance will be created"
}

variable "key_name" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
}

variable "instance_type" {
  description = "EC2 Instance Type"
}

variable "subnet_id" {
  description = "ID of the subnet where the instance will be deployed"
}

variable "vpc_id" {
  description = "ID of the VPC where the instance will be deployed"
}
