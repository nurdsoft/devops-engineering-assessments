variable "Region" {
  description = "AWS region where the resources will be deployed"
  type        = string
}

variable "InstanceType" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
}

variable "Key_Name" {
  description = "Name of the SSH key pair to use for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be deployed"
  type        = string

}
variable "vpc_id" {
  description = "ID of the VPC where the resources will be deployed"
  type        = string
}

