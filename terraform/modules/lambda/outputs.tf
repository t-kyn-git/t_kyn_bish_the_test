output "lambda_function_name" {
  value = aws_lambda_function.lambda_function_payload.function_name
}

output "lambda_function_url" {
  value = aws_lambda_function_url.lambda_function_url.function_url
}
