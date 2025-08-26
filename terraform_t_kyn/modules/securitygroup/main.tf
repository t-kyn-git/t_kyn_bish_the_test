resource "aws_security_group" "allow_http_ssh" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.ssh_from_port
    to_port     = var.ssh_to_port
    protocol    = var.ssh_protocol
    cidr_blocks = var.ssh_cidr_blocks
  }

  ingress {
    from_port   = var.http_from_port
    to_port     = var.http_to_port
    protocol    = var.http_protocol
    cidr_blocks = var.http_cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }
}

resource "aws_security_group" "allow_db_write" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.db_write_from_port
    to_port     = var.db_write_to_port
    protocol    = var.db_write_protocol
    cidr_blocks = var.db_write_cidr_blocks
  }
}

resource "aws_security_group" "allow_db_read" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.db_read_from_port
    to_port     = var.db_read_to_port
    protocol    = var.db_read_protocol
    cidr_blocks = var.db_read_cidr_blocks
  }
}
