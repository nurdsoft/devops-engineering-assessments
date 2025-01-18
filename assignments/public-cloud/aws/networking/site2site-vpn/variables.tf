variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "customer_gateway_ip" {
  description = "Public IP of the on-premises VPN gateway"
  type        = string
}

variable "bgp_asn" {
  description = "BGP Autonomous System Number for the Customer Gateway"
  type        = number
}

variable "tunnel_inside_cidr" {
  description = "List of inside CIDR blocks for the tunnels"
  type        = list(string)
}