resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block
}
#cidr_block = "10.0.0.0/16"
