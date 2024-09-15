# 現在のCloudWatchモジュールには変数がありませんが、将来追加する場合に備えたプレースホルダー
variable "alarm_name" {
  description = "Name of the CloudWatch Alarm"
  type        = string
  default     = "cpu-utilization-high"
}

variable "comparison_operator" {
  description = "Comparison operator for the CloudWatch Alarm"
  type        = string
  default     = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  description = "Evaluation periods for the CloudWatch Alarm"
  type        = number
  default     = 2
}

variable "metric_name" {
  description = "Metric name for the CloudWatch Alarm"
  type        = string
  default     = "CPUUtilization"
}

variable "namespace" {
  description = "Namespace for the CloudWatch Alarm"
  type        = string
  default     = "AWS/RDS"
}

variable "period" {
  description = "Period for the CloudWatch Alarm in seconds"
  type        = number
  default     = 120
}

variable "statistic" {
  description = "Statistic type for the CloudWatch Alarm"
  type        = string
  default     = "Average"
}

variable "threshold" {
  description = "Threshold for the CloudWatch Alarm"
  type        = number
  default     = 75
}

variable "alarm_description" {
  description = "Description of the CloudWatch Alarm"
  type        = string
  default     = "This metric monitors RDS master DB CPU usage"
}

variable "actions_enabled" {
  description = "Whether the alarm actions should be enabled"
  type        = bool
  default     = true
}
