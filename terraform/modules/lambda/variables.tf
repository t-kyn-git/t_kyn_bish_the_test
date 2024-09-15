variable "s3_bucket" {
  description = "The name of the S3 bucket to be used by Lambda"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "lambda_function_payload"
}

variable "role_name" {
  description = "Name of the IAM Role for Lambda"
  type        = string
  default     = "lambda_role"
}

variable "source_file" {
  description = "Path to the source file for Lambda function"
  type        = string
  default     = "lambda/index.js"
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
  default     = "index.handler"
}

variable "runtime" {
  description = "Runtime environment for Lambda"
  type        = string
  default     = "nodejs14.x"
}

variable "s3_policy_arn" {
  description = "ARN of the Amazon S3 Full Access policy"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

variable "api_gateway_policy_arn" {
  description = "ARN of the Amazon API Gateway Invoke Full Access policy"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonAPIGatewayInvokeFullAccess"
}

variable "basic_execution_policy_arn" {
  description = "ARN of the AWS Lambda Basic Execution Role policy"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
