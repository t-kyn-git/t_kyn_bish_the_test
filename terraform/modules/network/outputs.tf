# modules/network/outputs.tf

#output "vpc_id" {
#  value = aws_vpc.main_vpc.id
#}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id_db1" {
  value = aws_subnet.private_subnet_db1.id
}

output "private_subnet_id_db2" {
  value = aws_subnet.private_subnet_db2.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

