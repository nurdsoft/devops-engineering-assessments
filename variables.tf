variable "region" {
  description = "The region in which to deploy the EC2 instance."
  type        = string
}

variable "ami" {
  description = <<DESC
AMI to use for the instance. Required unless launch_template is specified and
the Launch Template specifes an AMI. If an AMI is specified in the Launch
Template, setting ami will override the AMI specified in the Launch Template.
DESC
  type        = string
  default     = "ami-0341aeea105412b57"
}

variable "associate_public_ip_address" {
  description = <<DESC
Whether to associate a public IP address with an instance in a VPC.
DESC
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance."
  type        = string
}

variable "instance_type" {
  description = <<DESC
The instance type to use for the instance. Updates to this field will trigger a
stop/start of the EC2 instance.
DESC
  type        = string
}

variable "tags" {
  description = <<DESC
A map of tags to assign to the resource. Note that these tags apply to the
instance and not block storage devices. If configured with a provider
default_tags configuration block present, tags with matching keys will overwrite
those defined at the provider-level.
DESC
  type        = map(string)
  default = {
    Name        = "terraform-poc"
    Environment = "dev"
  }
}

variable "subnet_id" {
  description = "VPC Subnet ID in which to launch the subnet in."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID in which to deploy the instance."
  type        = string
}
