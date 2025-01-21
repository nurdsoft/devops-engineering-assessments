terraform {
  required_version = ">= 1.10.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.84.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Ubuntu 24.04 AMI in us-east-1 (x86_64); owned by Canonical (099720109477).
data "aws_ami" "ubuntu_2404" {
  filter {
    name   = "image-id"
    values = ["ami-04b4f1a9cf54c11d0"]
  }
  most_recent = true
  owners      = ["099720109477"]
}

resource "aws_security_group" "ssh_sg" {
  name        = "ec2-ssh-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # NOT RECOMMENDED. its better to use local ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "linux_ec2" {
  ami                    = data.aws_ami.ubuntu_2404.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "daniels-technical-assessment"
  }
}
