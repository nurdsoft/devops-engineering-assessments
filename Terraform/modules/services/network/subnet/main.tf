resource "aws_subnet" "demo_subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr
    availability_zone = var.availability_zone 
    tags = {
        Name = "demo_subnet"
    }
}