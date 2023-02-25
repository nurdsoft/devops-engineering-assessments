terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
 access_key = "AKIATHXEQCKZX3QQT46T"
 secret_key = "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"
 region = var.region 
}