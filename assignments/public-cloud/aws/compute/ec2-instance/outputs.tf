output "vpn_connection_id" {
  description = "VPN connection ID"
  value       = aws_vpn_connection.vpn.id
}

output "vpn_tunnel_ips" {
  description = "Public IPs of VPN tunnels"
  value       = aws_vpn_connection.vpn.tunnel1[*].outside_ip_address
}
