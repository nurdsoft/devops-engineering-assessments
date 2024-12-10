terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  alias = "aws-us-west-2"
  region = var.region
}