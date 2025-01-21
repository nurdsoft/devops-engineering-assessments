terraform {
  required_version = ">= 1.10.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.84.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_customer_gateway" "this" {
  bgp_asn    = var.bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"

  tags = {
    Name = "nurdsoft-customer-gateway"
  }
}

resource "aws_vpn_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "nurdsoft-vpg"
  }
}

resource "aws_vpn_gateway_attachment" "this" {
  vpn_gateway_id = aws_vpn_gateway.this.id
  vpc_id         = var.vpc_id
}

resource "aws_vpn_connection" "this" {
  customer_gateway_id = aws_customer_gateway.this.id
  vpn_gateway_id      = aws_vpn_gateway.this.id
  type                = "ipsec.1"

  static_routes_only = false

  tunnel1_inside_cidr = element(var.tunnel_inside_cidr, 0)
  tunnel2_inside_cidr = element(var.tunnel_inside_cidr, 1)

  tags = {
    Name = "nurdsoft-s2s-vpn"
  }
}
