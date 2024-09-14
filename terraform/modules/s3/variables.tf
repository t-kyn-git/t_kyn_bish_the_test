# 現在のS3モジュールには変数がありませんが、将来追加する場合に備えたプレースホルダー
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "my-test-bucket"
}
