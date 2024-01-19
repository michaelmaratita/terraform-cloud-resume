data "aws_route53_zone" "my_domain" {
  name         = var.cdn_alias
  private_zone = false
}

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.my_domain.zone_id
}

resource "aws_route53_record" "cdn_record" {
  zone_id = data.aws_route53_zone.my_domain.zone_id
  name    = var.cdn_alias
  type    = "A"
  
  alias {
    name = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
    zone_id = "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "blog" {
  zone_id = data.aws_route53_zone.my_domain.zone_id
  name    = "blog.${var.cdn_alias}"
  type    = "CNAME"
  ttl     = 30
  
  records = [ "hashnode.network" ]
}

resource "aws_route53_record" "www_blog" {
  zone_id = data.aws_route53_zone.my_domain.zone_id
  name    = "www.blog.${var.cdn_alias}"
  type    = "CNAME"
  ttl     = 30
  
  records = [ "hashnode.network" ]
}