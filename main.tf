terraform {
}

resource "aws_instance" "my_instance" {
  ami                    = "ami-0e2c8caa4b6378d8c" # Example AMI ID, change as needed
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name

  tags = {
    Name = "MyEC2Instance"
  }

  associate_public_ip_address = true
}
