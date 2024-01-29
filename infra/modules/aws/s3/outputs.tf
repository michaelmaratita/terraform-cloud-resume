output "id" {
  description = "Name of the bucket."
  value = aws_s3_bucket.bucket.id
}

output "arn" {
  description = "ARN of the bucket. Will be of format arn:aws:s3:::bucketname"
  value = aws_s3_bucket.bucket.arn
}

output "bucket_domain_name" {
  description = "Bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value = aws_s3_bucket.bucket.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Regional Domain Name for S3 Bucket"
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}