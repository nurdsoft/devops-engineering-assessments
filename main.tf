resource "aws_instance" "example_instance" {
  ami             = data.aws_ami_ids.ubuntu.id # Use a valid AMI ID for your region
  instance_type   = var.instance_type   # Choose an instance type
  key_name        = var.key_name        # Name of your EC2 key pair
  tags            = var.instance_tags
  security_groups = ["${aws_security_group.allow_ssh.name}"] # Open SSH access on port 22

}

resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/32"] # Replace with your IP address
  }
}
