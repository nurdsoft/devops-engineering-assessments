terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.55.0"
    }
  }
}

provider "aws" { 
  # Configuration options
  region = var.region
}



# Create Security Group 
resource "aws_security_group" "my_security_group" {
name        = "SSH Security Group"
description = "Enable SSH access on Port 22"
vpc_id      = var.vpc_id
ingress {
description      = "SSH Access"
from_port        = 22
to_port          = 22
protocol         = "tcp"
cidr_blocks      = ["0.0.0.0/0"]
}
egress {
from_port        = 0
to_port          = 0
protocol         = "-1"
cidr_blocks      = ["0.0.0.0/0"]
}
tags   = {
Name = "SSH Security Group"
}
}

#Create a new EC2 launch configuration
resource "aws_instance" "my_instance" {
ami                    = "ami-0e742cca61fb65051"
instance_type               = var.instance_type
key_name                    = var.key_name
security_groups             = [aws_security_group.my_security_group.id]
subnet_id                   = var.subnet_id
associate_public_ip_address = true
lifecycle {
create_before_destroy = true
}
tags = {
"Name" = "my_instance"
}
}