provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  tags = {
    Name = "Example EC2 Instance"
  }
}

output "InstanceId" {
  value = aws_instance.example.id
}

output "PublicIpAddress" {
  value = aws_instance.example.public_ip
}
