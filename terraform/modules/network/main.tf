resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = var.public_subnet_availability_zone
}

resource "aws_subnet" "private_subnet_db1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_db1_cidr_block
  availability_zone = var.private_subnet_db1_availability_zone
}

resource "aws_subnet" "private_subnet_db2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_db2_cidr_block
  availability_zone = var.private_subnet_db2_availability_zone
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.private_subnet_availability_zone
}

