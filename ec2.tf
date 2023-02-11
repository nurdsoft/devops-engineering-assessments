resource "aws_instance" "terraform-web" {
ami = "ami-0b69ea66ff7391e80"
instance_type = var.instance_type
key_name = var.key_name 
vpc_security_group_ids = ["${aws_security_group.terraform-webSG.id}"] 
subnet_id = var.subnet_id
associate_public_ip_address = true
source_dest_check = false
tags = {
       Name = "web"
          }
}
resource "aws_security_group" "terraform-webSG" {
description = "Accept incoming connections."

ingress {
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
   }
vpc_id = var.vpc_id

tags = {
     Name = "web-SG"
    }   
}
