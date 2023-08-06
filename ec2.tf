resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# GENERATE PEM KEY
resource "aws_key_pair" "tf-key-pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}

# SAVE FILE TO LOCAL SYSTEM
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "${var.key_name}.pem"
}

# Allow SSH 
resource "aws_security_group" "Allow" {
  name   = "Allow-ssh"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# CREATE EC2 INSTANCE #
resource "aws_instance" "ec2-web" {
  ami                         = "ami-0f34c5ae932e6f0e4"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.Allow.id]
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  user_data                   = <<-EOF
                        #!/bin/bash
                        sudo yum update -y
                        EOF
  tags = {
    Name = "nurdsoft-home-test"
  }
}
