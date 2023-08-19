variable "key_name" {
  description = "Key name of the Key Pair to use for the instance"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "type of instance"
  type        = string
  default     = "t3.micro"
}


variable "subnet_id" {
  description = "VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "instance_tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = true
}