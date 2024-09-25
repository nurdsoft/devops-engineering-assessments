# Variable Definitions for AWS Infrastructure

variable "region" {
  type        = string
  description = "Region: AWS region where the instance will be deployed"
  default     = "us-west-2" # Default region set to US West (Oregon)
}

variable "key_name" {
  type        = string
  description = "KeyName: Name of the SSH key to be installed on the instance"
  default     = "infra" # Default SSH key name
}

variable "instance_type" {
  type        = string
  description = "InstanceType: EC2 instance type (size of the instance)"
  default     = "t2.micro" # Default instance type
}

variable "subnet_id" {
  type        = string
  description = "SubnetId: ID of the subnet where the instance will be deployed"
  default = "subnet-a46befc1"
}

variable "vpc_id" {
  type        = string
  description = "VpcId: ID of the VPC where the instance will be deployed"
  default = "vpc-a6f052c3"
}

variable "aws_security_group" {
  type        = string
  description = "nurdsoft-terraform-test Firewall security group"
  default     = "nurdsoft-terraform-test-sg" # Default security group name
}

variable "aws_instance" {
  type    = string
  default = "nurdsoft-terraform-test" # Default name for the AWS instance
}

variable "aws_ami" {
  type    = string
  default = "amazon" # Option: ubuntu or amazon
}

variable "volume_size" {
  type    = string
  default = "10" # Default volume size 10 GB
}

variable "env" {
  type        = string
  description = "Environment: lab, dev, or prod"
  default     = "lab" # Default environment set to lab
}

variable "provisioned" {
  type        = string
  description = "Provisioning IAC by"
  default     = "terraform" # Default provisioned by value
}

variable "create_eip" {
  type        = bool
  description = "Enable/Disable Elastic IP"
  default     = false # Default is not to create an Elastic IP
}
