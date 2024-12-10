module "ec2" {
  source = "./modules/ec2"
  region = var.region
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_id = var.vpc_id

  providers = {
    aws = aws.aws-us-west-2
  }
}