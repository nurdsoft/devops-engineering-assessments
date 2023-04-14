
variable "region" {
  type        = string
  description = "AWS region where the instance will be deployed"
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key to be installed on the instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type (i.e size of the instance)"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the instance will be deployed"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the instance will be deployed"
}

