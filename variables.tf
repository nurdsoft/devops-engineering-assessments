variable "vpc_id" {
    type = string
    description = "enter vpc value"
    default = "vpc-039cd443122214def"
}
variable "subnet_id" {
    type = string
    description = "enter subnet value"
    default = "subnet-0409d3e8db0c7021b" 
} 
variable "region" {
    type = string
    description = "The region in which to create the EC2 instance"
    default = "us-east-1"
}
variable "key_name" {
    type = string
    description = "The name of the key pair to use for SSH access"
    default = "ec2key1" 
}
variable "instance_type" {
    type = string
    description = "The type of EC2 instance to launch"
    default = "t2.micro" 
}
