# Crate a new EC2 instance using terraform on AWS
resource "aws_instance" "FirstInstance" {
 ami =  "ami-0557a15b87f6559cf"
 #count = 1
 key_name = var.key_name
 instance_type = var.instance_type
 security_groups = [aws_security_group.security_Jenkins_port.id]
 subnet_id = var.subnet_id
 associate_public_ip_address = true
 lifecycle {
   create_before_destroy = true
 }
 tags = {
    Name = "nurdsoft_server"
 }
}

#Create a Security Group
resource "aws_security_group" "security_Jenkins_port" {
    name = "security_Jenkins_port"
    description = "security group for Jenkins"
    vpc_id      = var.vpc_id

    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


 # outbound from Jenkins server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_Jenkins_port"
  }
}

# output "PublicIpAddress" {
#   value = aws_instance.FirstInstance.public_ip
# }
# output "InstanceId" {
#     value = aws_instance.FirstInstance.id 
# }

