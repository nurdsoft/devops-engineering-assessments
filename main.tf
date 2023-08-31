provider "aws" {
    region = "eu-west-3"
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3Nza............"
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
	vpc_security_group_ids = "${var.vpc_security_group_ids}"
    instance_type = "${var.instance_type}"
    key_name = "ssh-key"
	associate_public_ip_address = "${var.associate_public_ip_address}"
} 

