provider "aws" {
  region = var.region
}

# Security Group
resource "aws_security_group" "nurdsoft_sg" {
  name        = "nurdsoft_sg"
  description = "Allow HTTP, HTTPS, and SSH inbound traffic"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "NurdsoftSG"
  }
}

resource "aws_instance" "nurdsoft_server" {
  ami                    = "ami-007868005aea67c54" # AMI de Amazon Linux 2
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.nurdsoft_sg.id]

  tags = {
    Name = "NurdsoftServer"
  }
}
