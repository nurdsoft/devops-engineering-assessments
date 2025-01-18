output "vpn_connection_id" {
  description = "VPN Connection ID"
  value       = aws_vpn_connection.example.id
}

output "vpn_connection_details" {
  description = "Details of the VPN connection"
  value = {
    id              = aws_vpn_connection.example.id
    customer_gateway_id = aws_vpn_connection.example.customer_gateway_id
    vpn_gateway_id  = aws_vpn_connection.example.vpn_gateway_id
    type            = aws_vpn_connection.example.type
    tunnel1_inside_cidr = aws_vpn_connection.example.tunnel1_inside_cidr
    tunnel2_inside_cidr = aws_vpn_connection.example.tunnel2_inside_cidr
    static_routes_only = aws_vpn_connection.example.static_routes_only
  }
}
