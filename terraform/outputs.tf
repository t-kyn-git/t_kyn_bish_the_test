output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = module.network.subnet_ids
}

output "cloudwatch_alarm_name" {
  description = "The name of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}
