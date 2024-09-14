# Main Terraform configuration
output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "cloudwatch_alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}
