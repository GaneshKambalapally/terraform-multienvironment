resource "aws_instance" "foreachdemo" {
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = lookup(var.instance_type,terraform.workspace)
  vpc_security_group_ids = ["sg-0b49e1088cdfcc09b"]

  tags = {
    Name = terraform.workspace
  }


  }
