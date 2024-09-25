# Terraform configuration specifying required version and providers
terraform {
  # required_version = ">= 1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67"
    }
  }
}
