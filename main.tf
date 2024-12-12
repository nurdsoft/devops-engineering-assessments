module "ssh_security_group" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"

  name                = "ssh-server"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "nurd-test-keyner-olivo"

  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [module.ssh_security_group.security_group_id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}
