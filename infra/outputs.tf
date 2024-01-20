output "my_site" {
  description = "Output for mycustomdomain to terminal"
  value = module.cloud_resume.myurl
}

output "api_domain_name" {
  description = "Output for mycustomdomain to terminal"
  value = module.cloud_resume.api_domain_name
}

output "cloudfront_distribution_id" {
  value = module.cloud_resume.cloudfront_distribution_id
}