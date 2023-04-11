terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region  = var.aws_region
  profile = var.profile
}
resource "aws_vpc" "demovpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "demovpc"
  }
}
resource "aws_subnet" "demopubsub" {
  vpc_id     = aws_vpc.demovpc.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = "demopubsubnet"
  }
}

resource "aws_internet_gateway" "demoig" {
  vpc_id = aws_vpc.demovpc.id
  tags = {
    Name = "demoig"
  }
}
resource "aws_route_table" "demoigroutetable" {
  vpc_id = aws_vpc.demovpc.id
  route  {
    cidr_block = var.ig_cidr
    gateway_id = aws_internet_gateway.demoig.id
  }
}

resource "aws_route_table_association" "demoroute_association" {
  route_table_id = aws_route_table.demoigroutetable.id
  subnet_id      = aws_subnet.demopubsub.id
}

resource "aws_security_group" "demopubsshsg" {
  vpc_id = aws_vpc.demovpc.id
  ingress {
    from_port  = var.ingress_rules.from_port
    to_port    = var.ingress_rules.to_port
    protocol   = var.ingress_rules.protocol
    cidr_blocks = [var.ingress_rules.cidr_block]
  }
  egress {
    from_port  = var.egress_rules.from_port
    to_port    = var.egress_rules.to_port
    protocol   = var.egress_rules.protocol
    cidr_blocks = [var.egress_rules.cidr_block]
  }
}
resource "aws_key_pair" "demokp" {
  key_name   = var.key_name
  public_key = var.ssh_key
}

resource "aws_instance" "demoec2" {
  subnet_id              = aws_subnet.demopubsub.id
  key_name               = aws_key_pair.demokp.key_name
  vpc_security_group_ids = [aws_security_group.demopubsshsg.id]
  instance_type          = var.instance_type
  ami                    = var.ami
  associate_public_ip_address = true
  tags = {
    Name = "demoec2"
  }
}












