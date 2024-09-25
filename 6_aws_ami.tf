# Data Source for Amazon AMIs

data "aws_ami" "amazon" {

  owners      = ["amazon"]
  most_recent = true


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

}
# Data Source for Ubuntu AMIs

data "aws_ami" "ubuntu" {

  owners      = ["amazon"]
  most_recent = true


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

}

