resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  cidr_name = var.vpc_name
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = element(var.subnet_cidrs, 0)
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_subnet_db1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = element(var.subnet_cidrs, 1)
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "private_subnet_db2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = element(var.subnet_cidrs, 2)
  availability_zone = "us-east-1c"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = element(var.subnet_cidrs, 3)
  availability_zone = "us-east-1d"
}
