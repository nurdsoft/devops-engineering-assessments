provider "aws" {
  region = var.region
}

resource "aws_instance" "example02" {
  ami           = "ami-0c94855ba95c71c99"
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