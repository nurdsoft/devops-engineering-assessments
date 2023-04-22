variable "region" {
  description = "AWS region where the instance will be deployed"
}

variable "key_name" {
  description = "Name of the SSH key to be installed on the instance"
}

variable "instance_type" {
  description = "EC2 instance type (i.e size of the instance)"
}

variable "subnet_id" {
  description = "ID of the subnet where the instance will be deployed"
}

variable "vpc_id" {
  description = "ID of the VPC where the instance will be deployed"
}
