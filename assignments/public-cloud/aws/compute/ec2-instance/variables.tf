variable "region" {
 type        = string
 description = "Region AWS"
 default     = "us-east-1"
 sensitive   = true
}

variable "key_name" {
 type        = string
 description = "Private Key name"
 default     = "key-pair-manhwas"
 sensitive   = true
}
 
variable "instance_type" {
 type        = string
 description = "Instance type for the EC2 instance"
 default     = "t2.micro"
 sensitive   = true
}
 
variable "subnet_id" {
 type        = string
 description = "Subnet ID for network interface"
 default     = "subnet-00ab64fafa51f33e9"
}
 
variable "vpc_id" {
 type        = string
 description = "Vpc for network interface"
 default     = "vpc-01109d4533509a7ac"
}
