output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main_vpc.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = [
    aws_subnet.public_subnet.id,
    aws_subnet.private_subnet_db1.id,
    aws_subnet.private_subnet_db2.id,
    aws_subnet.private_subnet.id
  ]
}
