data "aws_vpc" "vpc" {
    id     = "${var.vpc_id}"
}

data "aws_subnet" "example" {
  vpc_id     = "${var.vpc_id}"
  id         = "${var.subnet_id}"
}

resource "aws_security_group" "example" {
  name_prefix = "example-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99" # Linux AMI in us-east-1
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"

  vpc_security_group_ids = [aws_security_group.example.id]

  key_name               = "${var.key_name}"
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd"
    ]
  }
}
