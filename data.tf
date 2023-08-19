data "aws_ami_ids" "ubuntu" {
  # most_recent = true
  owners      = ["amazon"] 

  # filter {
  #   name   = "name"
  #   values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  # }

}
