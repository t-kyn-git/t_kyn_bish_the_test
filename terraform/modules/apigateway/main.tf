resource "aws_api_gateway_rest_api" "my_api" {
  name = "MyAPI"
}

#output "api_id" {
#  value = aws_api_gateway_rest_api.my_api.id
#}
