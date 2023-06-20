variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-04893cdb768d0f9ee"

}

variable "key_name" {
  type    = string
  default = "devops1"
}
variable "subnet_id" {
  type    = string
  default = "subnet-0a31c9b28e7cfd24a"
}
