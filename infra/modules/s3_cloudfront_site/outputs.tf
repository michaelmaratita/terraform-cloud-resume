output "s3_id" {
  description = "Name of the bucket."
  value = module.s3.id
}

output "s3_arn" {
  description = "ARN of the bucket. Will be of format arn:aws:s3:::bucketname"
  value = module.s3.arn
}

output "bucket_domain_name" {
  description = "Bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value = module.s3.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Regional Domain Name for S3 Bucket"
  value = module.s3.bucket_regional_domain_name
}

output "cloudfront_id" {
  description = "Identifier for the distribution. For example: EDFDVBD632BHDS5."
  value = module.cloudfront_distribution.id
}

output "cloudfont_arn" {
  description = "ARN for the distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID"
  value = module.cloudfront_distribution.arn
}

output "cloudfont_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the distribution configuration."
  value = module.cloudfront_distribution.caller_reference
}

output "cloudfont_status" {
  description = "Current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
  value = module.cloudfront_distribution.status
}

output "cloudfont_tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = module.cloudfront_distribution.tags_all
}

output "cloudfont_trusted_key_groups" {
  description = "List of nested attributes for active trusted key groups, if the distribution is set up to serve private content with signed URLs."
  value = module.cloudfront_distribution.trusted_key_groups
}

output "cloudfont_trusted_signers" {
  description = "List of nested attributes for active trusted signers, if the distribution is set up to serve private content with signed URLs."
  value = module.cloudfront_distribution.trusted_signers
}

output "cloudfont_domain_name" {
  description = "Domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net"
  value = module.cloudfront_distribution.domain_name
}

output "cloudfont_last_modified_time" {
  description = "Date and time the distribution was last modified."
  value = module.cloudfront_distribution.last_modified_time
}

output "cloudfont_in_progress_validation_batches" {
  description = "Number of invalidation batches currently in progress."
  value = module.cloudfront_distribution.in_progress_validation_batches
}

output "cloudfont_etag" {
  description = "Current version of the distribution's information. For example: E2QWRUHAPOMQZL."
  value = module.cloudfront_distribution.etag
}

output "cloudfont_hosted_zone_id" {
  description = "CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2."
  value = module.cloudfront_distribution.hosted_zone_id
}