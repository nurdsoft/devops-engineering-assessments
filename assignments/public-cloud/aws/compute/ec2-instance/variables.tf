variable "region" {
  type    = string
  default = "us-east-1"
}

variable "key_name" {
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}