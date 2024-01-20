output "myurl" {
  description = "Output for mycustomdomain to terminal"
  value = aws_route53_record.cdn_record.name
}

output "rest_api" {
  description = "Output for use on resource-apigateway-resource"
  value = aws_api_gateway_rest_api.api.id
}

output "rest_api_parent" {
  description = "Output for use on resource-apigateway-resource"
  value = aws_api_gateway_rest_api.api.root_resource_id
}

output "api_domain_name" {
  description = "Output for API domain to terminal"
  value = aws_api_gateway_domain_name.api.domain_name
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}