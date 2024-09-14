# EC2用セキュリティグループ
resource "aws_security_group" "allow_http_ssh" {
  vpc_id = aws_vpc.main_vpc.id

  # SSHアクセスを許可
  ingress {
    from_port   = var.ssh_from_port
    to_port     = var.ssh_to_port
    protocol    = var.ssh_protocol
    cidr_blocks = var.ssh_cidr_blocks
  }

  # HTTPアクセスを許可
  ingress {
    from_port   = var.http_from_port
    to_port     = var.http_to_port
    protocol    = var.http_protocol
    cidr_blocks = var.http_cidr_blocks
  }

  # 全てのアウトバウンドトラフィックを許可
  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }
}
