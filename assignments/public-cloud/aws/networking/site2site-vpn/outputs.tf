output "VpnConnectionId" {
  description = "The ID of the VPN connection"
  value       = aws_vpn_connection.site_to_site_vpn.id
}

output "VpnTunnelIps" {
  description = "Public IPs of the VPN tunnels"
  value = [
    aws_vpn_connection.site_to_site_vpn.tunnel1_address,
    aws_vpn_connection.site_to_site_vpn.tunnel2_address
  ]
}
