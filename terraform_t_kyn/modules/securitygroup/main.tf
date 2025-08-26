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

resource "aws_security_group" "allow_mysql" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.mysql_from_port
    to_port     = var.mysql_to_port
    protocol    = var.mysql_protocol
    cidr_blocks = var.mysql_cidr_blocks
  }
}