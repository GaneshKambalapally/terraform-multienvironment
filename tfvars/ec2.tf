resource "aws_instance" "foreachdemo" {
  for_each = var.instances
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = each.value
  vpc_security_group_ids = [aws_security_group.Secure_SSH.id]

  tags = {
    Name = each.key
  }


  }

resource "aws_security_group" "Secure_SSH" {
  name        = "Secure SSH-${var.tags}"
  description = "allow secure connections"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "SSH Secure-${var.tags}"
  }
}

