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
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf-subnet"
  }
}

resource "aws_network_interface" "my_network_interface" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0e742cca61fb65051" # us-west-2
  instance_type = "t2.micro"
  key_name= "aws_key"
    vpc_security_group_id = [aws_security_group.my_security_group.id]
    

  network_interface {
    network_interface_id = aws_network_interface.my_network_interface.id
    device_index         = 0
  }

  
}
 resource "aws_security_group" "my_security_group" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
} 


