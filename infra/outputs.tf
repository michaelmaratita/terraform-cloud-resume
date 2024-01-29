output "url" {
  description = "my resume site url"
  value = module.resume_site.url
}

output "cloudfront_distribution_id" {
  description = "Output for CloudFront distribution ID for GitHub actions"
  value = module.resume_site.cloudfront_distribution_id
}