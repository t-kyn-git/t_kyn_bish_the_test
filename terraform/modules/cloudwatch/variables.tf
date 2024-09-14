# 現在のCloudWatchモジュールには変数がありませんが、将来追加する場合に備えたプレースホルダー
variable "alarm_name" {
  description = "The name of the CloudWatch alarm"
  type        = string
  default     = "cpu-utilization-high"
}
