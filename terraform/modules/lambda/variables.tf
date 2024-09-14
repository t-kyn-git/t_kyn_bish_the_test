variable "s3_bucket" {
  description = "The name of the S3 bucket to be used by Lambda"
  type        = string
}

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "lambda_function_payload"
}
