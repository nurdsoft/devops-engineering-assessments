

resource "aws_security_group" "demoinstance_sg" {
    vpc_id = var.vpc_id
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
}
resource "aws_instance" "demoinstance_ec2" {
    subnet_id = var.subnet_id
    instance_type = var.instance_type
    ami = var.ami
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.demoinstance_sg.id]
    associate_public_ip_address = true
}