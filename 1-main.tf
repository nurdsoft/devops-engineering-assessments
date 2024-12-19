resource "aws_security_group" "sg_instance" {
  name        = var.sg_name
  description = "allow ssh protocol on port 22"

  ingress {
    description = "ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "https port"
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
  tags = {
    Name  = "${local.server_name}"
    env   = "${local.env}"
    Owner = "${local.Owner}-infra"
  }
}

resource "aws_instance" "nurdsoft_ec2" {
  ami           = var.ami_id
  instance_type = var.InstanceType
  #   this is the best practice used for ssh connections
  user_data = <<-EOF
                #!/bin/bash
                sudo echo "${file("~/.ssh/id_rsa.pub")}" >> /home/ubuntu/.ssh/authorized_keys
                EOF

  tags = {
    Name  = "${local.server_name}"
    env   = "${local.env}"
    Owner = "${local.Owner}"
  }
  vpc_security_group_ids = [aws_security_group.sg_instance.id]
}