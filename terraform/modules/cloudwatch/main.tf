#resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
#  alarm_name          = "cpu-utilization-high"
#  comparison_operator = "GreaterThanThreshold"
#  evaluation_periods  = "2"
#  metric_name         = "CPUUtilization"
#  namespace           = "AWS/RDS"
#  period              = "120"
#  statistic           = "Average"
#  threshold           = "75"
#
#  alarm_description = "This metric monitors RDS master DB CPU usage"
#  actions_enabled   = true
#}

#output "alarm_name" {
#  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
#}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  alarm_description   = var.alarm_description
  actions_enabled     = var.actions_enabled
}
