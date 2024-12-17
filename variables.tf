variable "region" {
  description = "The AWS region to deploy resources."
  type        = string
}

variable "instance_type" {
  description = "The instance type to deploy."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to deploy the instance into."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to deploy the instance into."
  type        = string
}

variable "key_name" {
  description = "The key name for SSH access."
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules for the Security Group"
  type = list(object({
    description = string
    port        = number
  }))
  default = [
    { description = "SSH access", port = 22 },
    { description = "HTTP access", port = 80 },
    { description = "HTTPS access", port = 443 }
  ]
}
