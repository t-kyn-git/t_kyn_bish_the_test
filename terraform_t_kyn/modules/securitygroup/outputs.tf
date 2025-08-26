output "security_group_id" {
  value = aws_security_group.allow_http_ssh.id
}

output "mysql_security_group_id" {
  value = aws_security_group.allow_mysql.id
}