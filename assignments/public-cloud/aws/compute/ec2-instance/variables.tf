variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "ID of the AWS VPC"
  type        = string
}

variable "customer_gateway_ip" {
  description = "Public IP of on-premises VPN gateway"
  type        = string
}

variable "bgp_asn" {
  description = "AWS BGP ASN for VPN"
  type        = string
}

variable "tunnel_inside_cidr" {
  description = "List of CIDRs for VPN tunnels"
  type        = list(string)
}
