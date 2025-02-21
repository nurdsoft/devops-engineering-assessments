provider "aws" {
  region = var.region
}

data "aws_route_table" "main" {
  vpc_id = var.vpc_id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}

resource "aws_cloudwatch_log_group" "vpn_log_group" {
  name              = "/aws/vpn/site-to-site/my-vpn-logs"
  retention_in_days = 3
}

resource "aws_customer_gateway" "example_customer" {
  bgp_asn    = var.bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"
}

resource "aws_vpn_gateway" "example_gateway" {
  vpc_id = var.vpc_id
}

resource "aws_vpn_gateway_attachment" "this" {
  vpc_id         = var.vpc_id
  vpn_gateway_id = aws_vpn_gateway.example_gateway.id
}

resource "aws_vpn_connection" "example" {
  customer_gateway_id = aws_customer_gateway.example_customer.id
  vpn_gateway_id      = aws_vpn_gateway.example_gateway.id
  type                = "ipsec.1"
  static_routes_only  = false

  tunnel1_log_options {
    cloudwatch_log_options {
      log_enabled = true
      log_group_arn = aws_cloudwatch_log_group.vpn_log_group.arn
    }
  }

  tunnel2_log_options {
    cloudwatch_log_options {
      log_enabled = true
      log_group_arn = aws_cloudwatch_log_group.vpn_log_group.arn
    }
  }

  tunnel1_inside_cidr = element(var.tunnel_inside_cidr, 0)
  tunnel2_inside_cidr = element(var.tunnel_inside_cidr, 1)
}

resource "aws_vpn_gateway_route_propagation" "vpn_gw_route_propagation" {
  route_table_id = data.aws_route_table.main.id
  vpn_gateway_id = aws_vpn_gateway.example_gateway.id
}