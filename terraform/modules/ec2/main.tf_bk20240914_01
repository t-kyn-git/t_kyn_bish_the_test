# EC2 インスタンスの作成（パブリックとプライベート）
resource "aws_instance" "public_instance" {
  ami           = "ami-12345678"  # LocalStackで使うモックAMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
}

resource "aws_instance" "private_instance" {
  ami           = "ami-12345678"  # LocalStackで使うモックAMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
}