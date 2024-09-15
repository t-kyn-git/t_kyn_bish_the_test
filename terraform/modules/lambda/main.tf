data "archive_file" "example_zip" {
  type        = "zip"
  source_file = var.source_file
  output_path = "/tmp/lambda_function_payload.zip"
}

resource "aws_lambda_function" "lambda_function_payload" {
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = var.handler
  runtime          = var.runtime
  filename         = data.archive_file.example_zip.output_path
  source_code_hash = data.archive_file.example_zip.output_base64sha256
}

resource "aws_lambda_function_url" "lambda_function_url" {
  function_name      = aws_lambda_function.lambda_function_payload.function_name
  authorization_type = "NONE"
}

resource "aws_iam_role" "lambda_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_s3_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = var.s3_policy_arn
}

resource "aws_iam_role_policy_attachment" "lambda_api_gateway_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = var.api_gateway_policy_arn
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = var.basic_execution_policy_arn
}
