resource "aws_vpc" "demo_vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "demo_vpc"
    }
}