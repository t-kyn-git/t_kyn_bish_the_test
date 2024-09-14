resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_public
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_subnet_db1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_private_db1
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "private_subnet_db2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_private_db2
  availability_zone = "us-east-1c"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_private
  availability_zone = "us-east-1d"
}
