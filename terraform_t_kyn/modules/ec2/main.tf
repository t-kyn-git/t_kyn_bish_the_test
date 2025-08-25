###EC2_INSTANCE_ADD
resource "aws_instance" "public_instance" {
  ami           = var.public_instance_ami
  instance_type = var.public_instance_type
  subnet_id     = var.public_subnet_id

	vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.public_instance_name
  }
}

resource "aws_instance" "private_instance" {
  ami           = var.private_instance_ami
  instance_type = var.private_instance_type
  subnet_id     = var.private_subnet_id

  tags = {
    Name = var.private_instance_name
  }
}
