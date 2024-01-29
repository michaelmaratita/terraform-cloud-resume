output "url" {
  description = "my url from cloudfront"
  value = module.cloudfront_record.fqdn
}

output "cloudfront_distribution_id" {
  description = "Output for CloudFront distribution ID for GitHub actions"
  value = module.static_website.cloudfront_id
}