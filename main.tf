terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region             # region AWS
}

resource "aws_instance" "example" {
  ami = "ami-05b10e08d247fb927"   # id ami in us-east-1 for t2.micro amazon linux  
  key_name = var.key_name              # key name for connect EC2 Instance
  instance_type = var.instance_type         # this value must be t2.micro
  subnet_id = var.subnet_id             # id of the subnet in which the ec2 instance will run
  vpc_security_group_ids = [aws_security_group.example.id] # id of the security group created for the instance
}


#this section will be used for setup rules in the security group created for the instance
resource "aws_security_group" "example" {
  vpc_id      = var.vpc_id
 
  ingress {
    description      = "Allow traffic on port 22 from everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

