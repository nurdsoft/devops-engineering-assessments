provider "aws" {
  region = var.Region
}

# VPC
resource "aws_vpc" "main_vpn" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPNProjectVPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpn.id

  tags = {
    Name = "InternetGateway"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpn.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.Region}a"

  tags = {
    Name = "PublicSubnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpn.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.Region}a"

  tags = {
    Name = "PrivateSubnet"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpn.id

  tags = {
    Name = "PublicRouteTable"
  }
}

# Add Internet Gateway to Public Route Table
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate Public Route Table with Public Subnet
resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Route Table for Private Subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpn.id

  propagating_vgws = [aws_vpn_gateway.vgw.id]

  tags = {
    Name = "PrivateRouteTable"
  }
}

# Associate Private Route Table with Private Subnet
resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

# Virtual Private Gateway
resource "aws_vpn_gateway" "vgw" {
  vpc_id = aws_vpc.main_vpn.id

  tags = {
    Name = "VPNVirtualGateway"
  }
}

# Customer Gateway
resource "aws_customer_gateway" "on_premises_gateway" {
  bgp_asn    = var.BgpAsn
  ip_address = var.CustomerGatewayIp
  type       = "ipsec.1"

  tags = {
    Name = "OnPremisesCustomerGateway"
  }
}

# Attach Virtual Private Gateway to VPC
resource "aws_vpn_gateway_attachment" "vpc_gateway_attachment" {
  vpn_gateway_id = aws_vpn_gateway.vgw.id
  vpc_id         = aws_vpc.main_vpn.id
}

# VPN Connection
resource "aws_vpn_connection" "site_to_site_vpn" {
  customer_gateway_id = aws_customer_gateway.on_premises_gateway.id
  vpn_gateway_id      = aws_vpn_gateway.vgw.id
  type                = "ipsec.1"
  static_routes_only  = false

  tunnel1_inside_cidr = element(var.TunnelInsideCidr, 0)
  tunnel2_inside_cidr = element(var.TunnelInsideCidr, 1)

  tags = {
    Name = "SiteToSiteVPNConnection"
  }
}

