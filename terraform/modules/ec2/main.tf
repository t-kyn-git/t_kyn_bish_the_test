#resource "aws_security_group" "allow_http_ssh" {
#  vpc_id = var.vpc_id
#
#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}

###EC2_INSTANCE_ADD
resource "aws_instance" "public_instance" {
  ami           = "ami-12345678"  # モックAMI ID
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "PublicInstance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = "ami-12345678"  # モックAMI ID
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id

  tags = {
    Name = "PrivateInstance"
  }
}
