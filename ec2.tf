resource "aws_security_group" "ec2_security_group" {
  name        = "ec2-machine-ssh-sg"
  description = "EC2 security group to allow SSH connection"
  vpc_id      = var.vpc_id
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


resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  tags = {
    Name = "test_ec2_instance"
  }
}





