output "public_instance_id" {
  value = aws_instance.public_instance.id
}

output "private_instance_id" {
  value = aws_instance.private_instance.id
}

output "private_instance_db1_id" {
  value = aws_instance.private_instance_db1.id
}

output "private_instance_db2_id" {
  value = aws_instance.private_instance_db2.id
}