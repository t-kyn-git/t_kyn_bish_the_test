resource "aws_lambda_function" "lambda_function_payload" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename      = data.archive_file.example_zip.output_path
  source_code_hash = data.archive_file.example_zip.output_base64sha256
}
