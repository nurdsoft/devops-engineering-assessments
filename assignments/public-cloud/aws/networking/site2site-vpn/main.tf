provider "aws" {
  region = var.region
}

resource "aws_customer_gateway" "example" {
  bgp_asn    = var.bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"

  tags = {
    Name = "Example-Customer-Gateway"
  }
}

resource "aws_vpn_gateway" "example" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Example-Virtual-Gateway"
  }
}

resource "aws_vpn_gateway_attachment" "example" {
  vpn_gateway_id = aws_vpn_gateway.example.id
  vpc_id         = var.vpc_id
}

resource "aws_vpn_connection" "example" {
  customer_gateway_id = aws_customer_gateway.example.id
  vpn_gateway_id      = aws_vpn_gateway.example.id
  type                = "ipsec.1"

  tunnel1_inside_cidr = var.tunnel_inside_cidr[0]
  tunnel2_inside_cidr = var.tunnel_inside_cidr[1]

  static_routes_only = false

  tags = {
    Name = "Example-VPN-Connection"
  }
}
