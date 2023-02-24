resource "aws_instance" "FirstInstance" {
 ami =  "ami-0caf778a172362f1c"
 #count = 1
 key_name = "keyec2"
 instance_type = "t2.micro"
 security_groups = ["security_Jenkins_port"]
 tags = {
    Name = "nurdsoft_server"
 }
}

resource "aws_security_group" "security_Jenkins_port" {
    name = "security_Jenkins_port"
    description = "security group for Jenkins"

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

output "PublicIpAddress" {
  value = aws_instance.FirstInstance.public_ip
}
output "InstanceId" {
    value = aws_instance.FirstInstance.arn 
}
# output "subnet_id" {
#   value = aws_instance.FirstInstance.subnet_id
# }