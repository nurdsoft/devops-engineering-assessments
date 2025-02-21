variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" {
  default = ""
}

variable "customer_gateway_ip" {
}

variable "bgp_asn" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "tunnel_inside_cidr" {
  type = list(string)
}