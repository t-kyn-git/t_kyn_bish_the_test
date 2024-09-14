resource "aws_route53_zone" "my_zone" {
  name = var.domain_name
}
