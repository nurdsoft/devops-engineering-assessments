<<<<<<< HEAD
resource "aws_instance" "ec2_demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_demo_sg.id]

  tags = {
    Name = "Created_By_Terraform"
  }
=======
resource "aws_instance" "ec2_demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_demo_sg.id]

  tags = {
    Name = "Created_By_Terraform_Automation"
  }
>>>>>>> 7c7688e3cace892dbd2e9260b6eedd282772e730
}