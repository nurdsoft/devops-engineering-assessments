provider "aws" {
  region = var.region
}

resource "aws_customer_gateway" "cg" {
  bgp_asn    = var.bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"
}

resource "aws_vpn_gateway" "vgw" {
  vpc_id = var.vpc_id
}

resource "aws_vpn_connection" "vpn" {
  customer_gateway_id = aws_customer_gateway.cg.id
  vpn_gateway_id      = aws_vpn_gateway.vgw.id
  type                = "ipsec.1"
  static_routes_only  = false

  dynamic "tunnel1" {
    for_each = var.tunnel_inside_cidr
    content {
      tunnel_inside_cidr = tunnel1.value
    }
  }
}
