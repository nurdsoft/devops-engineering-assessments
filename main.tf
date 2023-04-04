variable "awsprops" {
  type = map(string)
  default = {
    region       = "us-west-2"
    vpc          = "vpc-a6f052c3"
    ami          = "ami-09d2c265e123a3907"
    itype        = "t2.micro"
    subnet       = "subnet-a46befc1"
    publicip     = true
    keyname      = "infra"
    secgroupname = "Test-Sec-Group"
  }
}

provider "aws" {
  region     = lookup(var.awsprops, "region")
  access_key = "AKIA4J7OMSGFEHS7I37G"
  secret_key = "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"
}

resource "aws_security_group" "test-iac-sg" {
  name        = lookup(var.awsprops, "secgroupname")
  description = lookup(var.awsprops, "secgroupname")
  vpc_id      = lookup(var.awsprops, "vpc")

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_instance" "test" {
  ami                         = lookup(var.awsprops, "ami")
  instance_type               = lookup(var.awsprops, "itype")
  subnet_id                   = lookup(var.awsprops, "subnet")
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name                    = lookup(var.awsprops, "keyname")


  vpc_security_group_ids = [
    aws_security_group.test-iac-sg.id
  ]
  root_block_device {
    delete_on_termination = true
    iops                  = 300
    volume_size           = 300
    volume_type           = "gp3"
  }
  tags = {
    Name        = "TEST-INSTANCE"
    Environment = "TEST-TEAM"
    OS          = "UBUNTU"
    Managed     = "IAC"
  }

  depends_on = [aws_security_group.test-iac-sg]
}


output "ec2instance" {
  value = aws_instance.test.public_ip
}
