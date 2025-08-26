output "security_group_id" {
  value = aws_security_group.allow_http_ssh.id
}

output "db_write_security_group_id" {
  value = aws_security_group.allow_db_write.id
}

output "db_read_security_group_id" {
  value = aws_security_group.allow_db_read.id
}