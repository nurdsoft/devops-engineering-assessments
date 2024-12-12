variable "region" {
  description = "AWS region where the instance will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Name of the SSH key to be installed on the instance"
  type        = string
  default     = "MC_Key"
}

variable "instance_type" {
  description = "EC2 instance type (i.e size of the instance)"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID of the subnet where the instance will be deployed"
  type        = string
  default     = "subnet-09e8461838cc756a7"
}

variable "vpc_id" {
  description = "ID of the VPC where the instance will be deployed"
  type        = string
  default     = "vpc-03d615e0d60310f0f"
}
