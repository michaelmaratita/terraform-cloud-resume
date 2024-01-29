variable "name" {
  description = "Name for Origin Access Control"
  type = string
}

variable "description" {
  description = "Description for Origin Access Control"
  type = string
}

variable "comment" {
  description = "Comment for CloudFront Distribution"
  type = string
}

variable "origin_id" {
  description = "ID for Origin Access Control"
  type = string
}

variable "domain_name" {
  description = "The name of the custom domain associated with Route53 and CloudFront"
  type        = string
}

variable "bucket_name" {
  description = "Name of S3 bucket"
  type = string
}

variable "bucket_policy_sid" {
  description = "Sid for Bucket Policy"
  type = string
}

variable "certificate" {
  description = "Certificate issued by ACM"
  type = string
}