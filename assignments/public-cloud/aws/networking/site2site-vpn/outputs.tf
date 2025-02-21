output "VpnConnectionId" {
  value = aws_vpn_connection.example.id
}

output "VpnTunnelIps" {
  value = [
    aws_vpn_connection.example.tunnel1_address,
    aws_vpn_connection.example.tunnel2_address
  ]
}
