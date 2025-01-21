output "VpnConnectionId" {
  description = "The ID of the VPN connection."
  value       = aws_vpn_connection.this.id
}

output "VpnTunnelIps" {
  description = "Public IPs of the two VPN tunnels."
  value = [
    aws_vpn_connection.this.tunnel1_address,
    aws_vpn_connection.this.tunnel2_address
  ]
}
