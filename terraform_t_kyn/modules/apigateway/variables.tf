# 現在のAPI Gatewayモジュールには変数がありませんが、将来追加する場合に備えたプレースホルダー
variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
  default     = "MyAPI"
}
