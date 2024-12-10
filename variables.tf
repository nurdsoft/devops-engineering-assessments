variable "region" {
  description = "The region in which the resources will be deployed"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instances"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
}

variable "subnet_id" {
  description = "The ID of the subnet in which the EC2 instances will be deployed"
}

variable "vpc_id" {
  description = "The ID of the VPC in which the EC2 instances will be deployed"
}