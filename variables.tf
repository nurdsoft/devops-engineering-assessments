variable "instance_name" {
        description = "Name of the instance to be created"
        default = "test"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-a5a72ce8"
}

variable "vpc_security_group_ids" {
        description = "This is the default VPC which will be created in"
        default = "vpc-3f139646"
}

variable "associate_public_ip_address" {
        description = "This is the default VPC which will be created in"
        default = true
}

variable "ami_id" {
        description = "The AMI to use"
        default = "ami-096b8af6e7e8fb927"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}