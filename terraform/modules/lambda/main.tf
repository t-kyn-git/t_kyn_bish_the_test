data "archive_file" "example_zip" {
  type        = "zip"
  source_file = "lambda/index.js"
  output_path = "/tmp/lambda_function_payload.zip"
}

resource "aws_lambda_function" "lambda_function_payload" {
  function_name = "lambda_function_payload"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename       = data.archive_file.example_zip.output_path
  source_code_hash = data.archive_file.example_zip.output_base64sha256
}

resource "aws_lambda_function_url" "lambda_function_url" {
  function_name      = aws_lambda_function.lambda_function_payload.function_name
  authorization_type = "NONE"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
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

#output "lambda_function_name" {
#  value = aws_lambda_function.lambda_function_payload.function_name
#}

#output "lambda_function_url" {
#  value = aws_lambda_function_url.lambda_function_url.function_url
#}
