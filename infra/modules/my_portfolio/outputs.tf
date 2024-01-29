output "url" {
  description = "my url from cloudfront"
  value = module.static_website.cloudfont_domain_name
}