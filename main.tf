provider "aws" {
  region = var.region
}

data "aws_ami" "base_ami" {
  most_recent      = true
  owners           = ["amazon"]
 
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
 
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
 
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
 
}

resource "aws_security_group" "ec2-assesment-sg" {
  name        = "ec2-assesment-sg"
  description = "Security group for SSH, HTTP, and HTTPS access"

  vpc_id = var.vpc_id
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] ## Not recommended IPs should be restricted
  }
  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2-nurdsoft-assesment" {
    ami           = "${data.aws_ami.base_ami.id}"
    instance_type = var.instance_type
    key_name      = var.key_name
    subnet_id     = var.subnet_id
    #Security options 
    monitoring = true
    ebs_optimized = true
    metadata_options {
         http_endpoint = "enabled"
         http_tokens   = "required"
    }  
    root_block_device {
        encrypted     = true
    }
    tags = {
        Name = "assesment-Instance"
    }
}
