resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

#resource "aws_subnet" "public_subnet" {
#  vpc_id            = aws_vpc.main_vpc.id
#  cidr_block        = "10.0.1.0/24"
#  availability_zone = "us-east-1a"
#}

#resource "aws_subnet" "private_subnet_db1" {
#  vpc_id            = aws_vpc.main_vpc.id
#  cidr_block        = "10.0.2.0/24"
#  availability_zone = "us-east-1b"
#}
