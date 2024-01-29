variable "certificate_arn" {
  description = "Optional) ARN for an AWS-managed certificate. AWS Certificate Manager is the only supported source. Used when an edge-optimized domain name is desired. Conflicts with certificate_name, certificate_body, certificate_chain, certificate_private_key, regional_certificate_arn, and regional_certificate_name."
  type = string
}

variable "domain_name" {
  description = "The name of the custom domain associated with Route53 and CloudFront"
  type = string
}