provider "aws" {
  region = var.region
}

resource "aws_instance" "demo" {
  ami                    = "ami-0c94855ba95c71c99"  # Replace with the desired Linux-based AMI ID
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "demo EC2 Instance"
  }
}

resource "aws_security_group" "instance" {
  name        = "demo-instance-sg"
  description = "Security group for the demo EC2 instance"

  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
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

output "instance_id" {
  value = aws_instance.demo.id
}

output "public_ip_address" {
  value = aws_instance.demo.public_ip
}