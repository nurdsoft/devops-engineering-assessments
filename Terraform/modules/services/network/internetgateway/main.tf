resource "aws_internet_gateway" "demo_ig" {
    vpc_id = var.vpc_id
    
}

resource "aws_route_table" "demo_routetable" {
    vpc_id = var.vpc_id
    route {
        cidr_block = var.ig_cidr_block
        gateway_id = aws_internet_gateway.demo_ig.id
    }
}

resource "aws_route_table_association" "demo_ig_routetable_association" {
    subnet_id = var.subnet_id
    route_table_id = aws_route_table.demo_routetable.id
}