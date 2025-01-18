provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316" # Example Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}

