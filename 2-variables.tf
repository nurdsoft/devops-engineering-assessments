variable "Region" {
  default = "us-east-2"
}

variable "InstanceType" {
  description = "Nombre del servidor web"
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI id for ec2 instance"
  default     = "ami-036841078a4b68e14"
}

variable "sg_name" {
  description = "security group name"
  default     = "nurdsoft-ec2"
}

# useless variables because by defalut use the default vpc and subnet on the region where was not defined
# variable "KeyName" {
#   description = "value of the key pair"
#   # i prefer use my personal ssh key located on my .ssh folder you can use your own replace the value with your key name.
# }

# variable "VpcId" {
#   description = "VPC ID"
# }

# variable "SubnetId" {
#   description = "value of the subnet id"
# }