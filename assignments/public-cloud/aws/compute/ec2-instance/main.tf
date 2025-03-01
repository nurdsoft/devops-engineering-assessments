# AWS provider setup
provider "aws" {
  region = var.region
}

# Create a vpc
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test-vpc"
  }
}

# Create a subnet
resource "aws_subnet" "test_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "test-subnet"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "test-igw"
  }
}

# Create a Route Table
resource "aws_route_table" "test_route_table" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = {
    Name = "test-route-table"
  }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "test_route_table_assoc" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.test_route_table.id
}


# Get debian bookworm
data "aws_ami" "test_debian_bookworm" {
  most_recent = false
  owners      = ["136693071363"]

  filter {
    name   = "image-id"
    values = ["ami-064519b8c76274859"]
  }
}

# Create ssh security group
resource "aws_security_group" "test_ssh_access" {
  name        = "test_allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test_allow_ssh"
  }
}

# Create EC2 instance
resource "aws_instance" "this" {
  ami                         = data.aws_ami.test_debian_bookworm.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.test_subnet.id
  vpc_security_group_ids      = [aws_security_group.test_ssh_access.id]
  associate_public_ip_address = true # Ensure public ip for ssh access

  tags = {
    Name = "test-debian-instance"
  }
}
