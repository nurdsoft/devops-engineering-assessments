variable "region" {
  description = "AWS region"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be launched"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the EC2 instance will be launched"
  type        = string
}