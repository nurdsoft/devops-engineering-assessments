# Terraform configuration for local state management
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Use the following block for a different backend configuration (S3)
# terraform {
#   backend "s3" {
#     bucket         = "nurdsoft-terraform-test"
#     key            = "state/nurdsoft-terraform-test/terraform.tfstate"
#     region         = "us-west-2"
#     encrypt        = true
#     dynamodb_table = "nurdsoft-terraform-test-tf-backend-locks"
#   }
# }


