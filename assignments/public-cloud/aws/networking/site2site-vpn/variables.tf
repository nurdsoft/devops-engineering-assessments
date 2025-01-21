variable "region" {
  type        = string
  description = "AWS region where the resources will be deployed."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the AWS VPC to connect to the on-premises data center."
}

variable "customer_gateway_ip" {
  type        = string
  description = "The public IP address of the on-premises VPN gateway."
}

variable "bgp_asn" {
  type        = number
  description = "BGP Autonomous System Number for the AWS side."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet within the VPC for VPN traffic."
}

variable "tunnel_inside_cidr" {
  type        = list(string)
  description = "Inside CIDR block for VPN tunnels (e.g., 169.254.x.x/30)."
}
