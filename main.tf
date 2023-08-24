provider "aws" {
  region = var.Region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID (us-east-1)
  instance_type = var.InstanceType
  key_name      = var.KeyName
  subnet_id     = var.SubnetId
  tags = {
    Name = "ExampleInstance"
  }
}

# Allow SSH inbound traffic
resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Example security group for SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # For demo purposes; restrict to your IP(s) in production
  }
}
