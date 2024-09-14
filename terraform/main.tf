terraform {
  required_version = ">= 1.0"
  backend "local" {}
}

provider "aws" {
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = "us-east-1"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  endpoints {
    ec2            = "http://localhost:4566"
    s3             = "http://localhost:4566"
    apigateway     = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
  }
}

module "network" {
  source = "./modules/network"
  vpc_cidr = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}

# Lambda 関数の ZIP アーカイブを作成
data "archive_file" "example_zip" {
  type        = "zip"
  source_file = "lambda/index.js"   # index.js のパスを正確に指定
  output_path = "lambda/lambda_function_payload.zip"
}

resource "aws_lambda_function" "lambda_function_payload" {
  function_name = "lambda_function_payload"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename      = data.archive_file.example_zip.output_path
  source_code_hash = data.archive_file.example_zip.output_base64sha256
}

resource "aws_lambda_function_url" "lambda_function_url" {
  function_name      = aws_lambda_function.lambda_function_payload.function_name
  authorization_type = "NONE"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "lambda.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_s3_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_api_gateway_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayInvokeFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "120"
  statistic           = "Average"
  threshold           = "75"
  alarm_description   = "This metric monitors RDS master DB CPU usage"
  actions_enabled     = true
}

#output "cloudwatch_alarm_name" {
#  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
#}
#
#output "vpc_id" {
#  value = module.network.vpc_id
#}
#
#output "subnet_ids" {
#  value = module.network.subnet_ids
#}
