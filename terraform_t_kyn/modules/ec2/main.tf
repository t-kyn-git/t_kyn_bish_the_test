###EC2_INSTANCE_ADD
resource "aws_instance" "public_instance" {
  ami           = var.public_instance_ami
  instance_type = var.public_instance_type
  subnet_id     = var.public_subnet_id

	vpc_security_group_ids = var.security_group_ids

  # adding public ip
  associate_public_ip_address = var.associate_public_ip
  
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

resource "aws_instance" "private_instance_db1" {
  ami           = var.private_instance_db_ami
  instance_type = var.private_instance_db_type
  subnet_id     = var.private_subnet_db1_id

  db_write_security_group_id = var.db_write_security_group_id
  #db_write_security_group_ids = var.db_write_security_group_ids

  tags = {
    Name = var.private_db1_instance_name
  }
}

resource "aws_instance" "private_instance_db2" {
  ami           = var.private_instance_db_ami
  instance_type = var.private_instance_db_type
  subnet_id     = var.private_subnet_db2_id

  db_read_security_group_id = var.db_read_security_group_id
  #db_read_security_group_ids = var.db_read_security_group_ids

  tags = {
    Name = var.private_db2_instance_name
  }
}