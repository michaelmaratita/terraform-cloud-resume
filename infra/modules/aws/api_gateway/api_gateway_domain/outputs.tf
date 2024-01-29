output "domain_name" {
  description = "(Required) Fully-qualified domain name to register."
  value = aws_api_gateway_domain_name.api.domain_name
}

output "arn" {
  description = "ARN of domain name."
  value = aws_api_gateway_domain_name.api.arn
}

output "certificate_upload_date" {
  description = "Upload date associated with the domain certificate."
  value = aws_api_gateway_domain_name.api.certificate_upload_date
}

output "cloudfront_domain_name" {
  description = "Hostname created by Cloudfront to represent the distribution that implements this domain name mapping."
  value = aws_api_gateway_domain_name.api.cloudfront_domain_name
}

output "cloudfront_zone_id" {
  description = "For convenience, the hosted zone ID (Z2FDTNDATAQYW2) that can be used to create a Route53 alias record for the distribution."
  value = aws_api_gateway_domain_name.api.cloudfront_zone_id
}

output "id" {
  description = "Internal identifier assigned to this domain name by API Gateway."
  value = aws_api_gateway_domain_name.api.id
}

output "regional_domain_name" {
  description = "Hostname for the custom domain's regional endpoint."
  value = aws_api_gateway_domain_name.api.regional_domain_name
}

output "regional_zone_id" {
  description = "Hosted zone ID that can be used to create a Route53 alias record for the regional endpoint."
  value = aws_api_gateway_domain_name.api.regional_zone_id
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_api_gateway_domain_name.api.tags_all
}