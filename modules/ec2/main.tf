resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.allow_ssh_http_https.id]
  tags = {
    Name = "EC2 Instance"
  }
}