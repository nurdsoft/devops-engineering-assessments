# Security Group Definition for EC2 Instances

resource "aws_security_group" "ec2-security-groups" {
  name        = var.aws_security_group
  description = var.aws_security_group
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound Traffic"
  }

  tags = {
    Name = var.aws_security_group
    Envinonment : var.env
    provisionedby : var.provisioned
  }
}

resource "aws_security_group_rule" "tcp_22" {
  description       = "Allowed SSH"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ec2-security-groups.id
}




