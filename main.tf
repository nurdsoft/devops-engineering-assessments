provider "aws" {
  region = var.region
}

resource "aws_instance" "instance" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  tags                        = var.tags
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    description = "SSH from the world"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "InstanceId" {
  description = <<DESC
The private DNS name assigned to the instance. Can only be used inside
Amazon EC2, and only available if you've enabled DNS hostnames for your VPC.
DESC
  value       = aws_instance.instance.private_dns
}

output "PublicIpAddress" {
  description = "The public IP of the EC2 instance."
  value       = aws_instance.instance.public_ip
}
