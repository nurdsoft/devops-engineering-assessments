variable "Region" {
  description = "AWS region where the resources will be deployed"
  type        = string
}

variable "VpcId" {
  description = "The ID of the AWS VPC to connect to the on-premises data center"
  type        = string
}

variable "CustomerGatewayIp" {
  description = "The public IP address of the on-premises VPN gateway"
  type        = string
}

variable "BgpAsn" {
  description = "Border Gateway Protocol (BGP) Autonomous System Number for the AWS side"
  type        = number
}

variable "TunnelInsideCidr" {
  description = "Inside CIDR block for VPN tunnels (e.g., 169.254.x.x/30)"
  type        = list(string)
}
