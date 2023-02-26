terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
 access_key = "AKIATHXEQCKZZN4AXYCK"
 secret_key = "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"
 region = var.region 
}
