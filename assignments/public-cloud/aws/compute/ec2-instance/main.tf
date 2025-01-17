provider "aws" {
  region = var.Region
}

# Importar clave pública desde tu máquina local
resource "aws_key_pair" "ssh_key" {
  key_name   = var.Key_Name              # Nombre que se registrará en AWS
  public_key = file("~/.ssh/mtckey.pub") # Ruta al archivo de clave pública
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-ig"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"
  tags = {
    Name = "public-subnet"
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public-rt"
  }
}

# Route for Internet Gateway
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

# Public Route Table Association
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group for EC2 Instance
resource "aws_security_group" "ssh_access" {
  name        = "ssh-access-sg"
  description = "Allow SSH access from the internet"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH"
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
    Name = "ssh-access-sg"
  }
}

# EC2 Instance
resource "aws_instance" "linux_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.InstanceType
  key_name      = aws_key_pair.ssh_key.key_name # Usar la clave registrada
  subnet_id     = aws_subnet.public.id

  # Asociar el grupo de seguridad
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = "LinuxInstance"
  }
}
