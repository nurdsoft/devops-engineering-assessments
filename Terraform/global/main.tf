terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region  = var.aws_region
  profile = var.profile
}
module "vpc_module" {
  source   = "../modules/services/network/vpc"
  vpc_cidr = var.vpc_cidr
}
module "subnet_module" {
  source      = "../modules/services/network/subnet"
  subnet_cidr = var.subnet_cidr
  availability_zone = var.availability_zone
  vpc_id      = module.vpc_module.vpc_id
}
module "internetgateway_module" {
  source        = "../modules/services/network/internetgateway"
  ig_cidr_block = "0.0.0.0/0"
  vpc_id        = module.vpc_module.vpc_id
  subnet_id     = module.subnet_module.subnet_id
}
module "demokeypair_module" {
  source        = "../modules/services/compute/keypair"
  key_name = var.key_name
  public_key = var.public_key
}
module "demoinstance_ec2_module" {
  source        = "../modules/services/compute/ec2"
  subnet_id     = module.subnet_module.subnet_id
  vpc_id        = module.vpc_module.vpc_id
  instance_type = var.instance_type
  ami           = var.ami
  key_name      = module.demokeypair_module.key_name
  public_key    = var.public_key
}
