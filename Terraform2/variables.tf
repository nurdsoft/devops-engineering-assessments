variable "aws_region" {
  type = string
}

variable "profile" {
  type = string
  default = "default"
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "ig_cidr" {
    type = string
    default = "0.0.0.0/0"
}
variable "ingress_rules" {
    type = object({
        from_port = number
        to_port = number
        protocol = string
        cidr_block = string
    })
    description = "ingress configuration"
    default = {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
    }
}

variable "egress_rules" {
    type = object({
        from_port = number
        to_port = number
        protocol = string
        cidr_block = string
    })
    description = "ingress configuration"
    default = {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_block = "0.0.0.0/0"
    }
}

variable "ssh_key" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCizdZrseI76b0DyUcx89Yd5ZbaHfVd+C445qOQp5+3FgYc/YrUSLwpKxladO8O4FdqgQHKJSxTp3HytzzA0AqOzelIDfc5jNLvmgndAOwfJiXShkDpiV9Cng0IDhMEWmKakNHsPdwuwwyWANRByXdtGGC5UqqHhYVQT3Q4lTm5+57aUOqkvIZBJfOBl2xne1iCHw6BHqEPzCFE+BGeQoV97xxwq4/MIBoGjVVx4UodBvCvpcPHtbzdcDincKKFNpVOmdAUvibeMe0RFWvbfX6308+zQIW4kK1ElxDuxqiMADQ2juPZeJE4odOYpQUHFwlcNCwLOz7agvRFqEhk9PaovRkg8zGPcIjHfgfLXf3VIWRlTfAahGVQH4aEcKuBPcI0fHGfwd6hyNDc9bSok/j5W6xkv5HgsWgAHH8+fLTzJJACRoY1CcdOD+tSXZWRjq5DOrCZQamLwO8HmUyt9yixUka484t+o+dlmaMutsPJzh4LS+CGZdH9PQnIiuViTE= 91738@DESKTOP-401QIT9"
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami" {
    type = string
    default = "ami-02eb7a4783e7e9317"
}
