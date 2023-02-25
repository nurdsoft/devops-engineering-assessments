variable "vpc_id" {
    # description = ""
    description = "enter vpc value"
    default = "vpc-039cd443122214def"
}
variable "subnet_id" {
    # description = ""
    description = "enter subnet value"
    default = "subnet-0409d3e8db0c7021b" 
} 
variable "region" {
    # description = ""
    description = "enter region value"
    default = "us-east-1"
}
variable "key_name" {
    # description = ""
    description = "enter key value"
    default = "ec2key1" 
}
variable "instance_type" {
    # description = ""
    description = "enter instance type value"
    default = "t2.micro" 
}
