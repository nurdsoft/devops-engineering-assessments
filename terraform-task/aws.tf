terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
 access_key = "AKIA5UCCFKP7Y62GZK2O"
 secret_key = "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"
 region = "ap-south-1" 
}