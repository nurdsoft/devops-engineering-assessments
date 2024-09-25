# Resource for Elastic IP

resource "aws_eip" "example" {
  count = var.create_eip ? 1 : 0
  tags = {
    Name          = var.aws_instance
    Environment   = var.env
    ProvisionedBy = var.provisioned
  }
}

resource "aws_eip_association" "aws_eip_association" {
  count         = var.create_eip ? 1 : 0
  instance_id   = aws_instance.example.id
  allocation_id = aws_eip.example[0].id
}
