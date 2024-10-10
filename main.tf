provider "aws" {
  region = "us-east-1"
}

variable "key_name" {
  description = "key_name"
  type        = string
}

variable "instance_type" {
  description = "instance_type"
  type        = string
}

variable "file_name" {
  description = "Name of the key pair"
  type        = string
}

variable "cidr_block" {
  description = "CIDR Block"
  type = string
  default = "10.0.0.0/28"
}

variable "region"{
  description = "Availability Zones for the Subnet"
  type = string
}

resource "aws_vpc" "test_env" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}


resource "aws_security_group" "security" {
  name = "allow-all"

  vpc_id = aws_vpc.test_env.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
} 

data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter{
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
  
}


resource "aws_instance" "test_env_ec2" {
 # count                       = var.counter
  ami                         = data.aws_ami.ubuntu_ami.id
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  security_groups             = ["${aws_security_group.security.id}"]
  associate_public_ip_address = true

  subnet_id = aws_subnet.subnet.id

}

resource "aws_internet_gateway" "test_env_gw" {
  vpc_id = aws_vpc.test_env.id
}

resource "aws_subnet" "subnet" {
  cidr_block        = cidrsubnet(aws_vpc.test_env.cidr_block, 3, 1)
  vpc_id            = aws_vpc.test_env.id
  availability_zone = var.region
}


resource "aws_key_pair" "tf_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}



# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "tf_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.file_name

}

output "PublicIpAddress" {
  value = aws_instance.test_env_ec2.public_ip
  depends_on = [
    aws_security_group.security
  ]
}

output "InstanceId" {
  value = aws_instance.test_env_ec2.id
}

