provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"  # Make sure to use the latest stable version

  name           = "linux-instance"
  instance_type  = var.instance_type
  ami            = "ami-02b49a24cfb95941c"
  key_name       = var.key_name
  subnet_id      = var.subnet_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "PublicUbuntuInstance"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access from anywhere"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AllowSSH"
  }
}

