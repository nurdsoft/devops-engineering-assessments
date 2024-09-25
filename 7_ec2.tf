# Resource for EC2 Instance

resource "aws_instance" "example" {
  ami           = var.aws_ami == "amazon" ? data.aws_ami.amazon.id : data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [
    aws_security_group.ec2-security-groups.id,
  ]

  key_name = var.key_name

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
    encrypted   = true
    tags = {
      Name       = var.aws_instance
      FileSystem = "/root"
      Envinonment : var.env
      provisionedby : var.provisioned
    }

  }

  metadata_options {
    instance_metadata_tags = "enabled"
    http_endpoint          = "enabled"
    http_tokens            = "required"
  }


  user_data = <<-EOF
    #!/bin/bash
    # Add Step on inital 
    echo "Completed."
  EOF


  tags = {
    Name = var.aws_instance
    Envinonment : var.env
    provisionedby : var.provisioned
  }

}
