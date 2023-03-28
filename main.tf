resource "aws_instance" "my_instance" {
  ami             = "ami-08d70e59c07c61a3a"
  instance_type   = var.ami_type
  security_groups = [aws_security_group.instances.name]
  key_name        = var.ami_key_pair_name
  subnet_id       = var.subnet_id
}


data "aws_vpc" "selected_vpc" {
  id = var.vpc_id
}

data "aws_subnet_ids" "selected_subnet" {
  vpc_id = var.vpc_id
}

resource "aws_security_group" "instances" {
  name = "instance-security-group"
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id

  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.instances.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}
