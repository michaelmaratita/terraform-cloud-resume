data "aws_route53_zone" "my_domain" {
  name         = var.my_domain
  private_zone = false
}