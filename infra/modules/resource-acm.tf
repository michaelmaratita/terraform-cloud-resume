provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_acm_certificate" "cert" {
  provider                  = aws.us-east-1
  domain_name               = var.cdn_alias
  subject_alternative_names = ["*.${var.cdn_alias}"]
  validation_method         = "DNS"

  tags = {
    Environment = "Production"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert" {
  provider                = aws.us-east-1
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}