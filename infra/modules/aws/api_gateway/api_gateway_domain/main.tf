resource "aws_api_gateway_domain_name" "api" {
  certificate_arn = var.certificate_arn
  domain_name     = var.domain_name
}