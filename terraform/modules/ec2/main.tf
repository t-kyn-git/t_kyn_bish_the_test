# EC2 インスタンスの作成（パブリックとプライベート）

resource "aws_instance" "public_instance" {
  ami           = var.public_instance_ami  # LocalStackで使うモックAMI ID
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "PublicInstance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = var.private_instance_ami  # LocalStackで使うモックAMI ID
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "PrivateInstance"
  }
}

# VPCとサブネットのデータソース
data "aws_vpc" "default" {
  default = true
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# セキュリティグループの作成（必要に応じて）
resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "Allow all inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# データソースの例（必要に応じて）
data "aws_ami" "latest_amazon_linux" {
  owners = ["amazon"]

  most_recent = true

  filters = {
    name = "amzn2-ami-hvm-*-x86_64-gp2"
  }
}
