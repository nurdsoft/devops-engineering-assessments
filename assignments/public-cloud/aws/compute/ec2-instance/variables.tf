variable "Region" {
  description = "AWS region where the resources will be deployed"
  type        = string
}

variable "InstanceType" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
}

variable "AMI" {
  description = "AMI ID for the EC2 instance"
  type        = string

}

