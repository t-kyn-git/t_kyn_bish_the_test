resource "aws_route53_zone" "my_zone" {
  name = var.domain_name
}

#output "zone_id" {
#  value = aws_route53_zone.my_zone.id
#}
