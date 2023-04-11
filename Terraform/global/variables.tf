variable "aws_region" {
    type = string
}
variable "profile" {
    type = string
    default = "default"
}
variable "ami" {
    type = string
    default = "ami-0851b76e8b1bce90b"
}
variable "instance_type" {
    type = string
}
variable "public_key" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8HfhPZwH4f/8tpJRL4pQsRfk2ZYG1LpHl+GHYFt9xE9tEgyGJ+d5kp8+HuWVjsmm0jH6T6ZnluvM6yENH9ep8MzKGdmH7SWuNYHNm9rZaWocr4Cl0vycBmZvVQcDMHvOdqfma+x8nh9Ut3gVz38pD23ma4ihZgW+C2mS6UEEMyfFVUjqxomp9jnxL87QnuvZIgt72HLvUMlHVJABLlYDSsYGnd8O6wcNP/F3DDwt8UOdl9aEAOguVIzmuYb8AYTOjuIcJN15KuocEoRlschUGqf8+AVzSQ5PdyQp0SwnS0KaW5KPd4nCkIwjBFZJmaBlW0QcJt9IXxk5voIhT2+Y/FBYaoGci0Pcuh24U6jVIuTpyOmgiaxcDkWRK2Fz8OzL2HAxUwbx3IcCJvuY2eri2ATbQT1zQ3bnPqDITnOKWm9rwgO8ZdcQ+41RFzOg7aE+9D/s1DxrCbh6WzkhhhYO110MiXCPRDIYfaz/Jbqcqtak3ARw4S7UspxRLdzukdfc= Sriman@DESKTOP-1QI4S5N"
}
variable "vpc_cidr" {
  type = string
}
variable "subnet_cidr" {
    type = string
}

variable "key_name" {
  type = string
}

variable "availability_zone" {
  type = string
  default = "ap-south-1a"
}