resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "120"
  statistic           = "Average"
  threshold           = "75"

  alarm_description = "This metric monitors RDS master DB CPU usage"
  actions_enabled   = true
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}
