resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-key-pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "${var.key_name}.pem"
}

resource "aws_security_group" "Allow" {
  name   = "Allow-ssh"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2-web" {
  ami                         = "ami-016eb5d644c333ccb"
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
