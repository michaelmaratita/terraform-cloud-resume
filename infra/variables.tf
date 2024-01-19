variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "public_path" {
  description = "The file path for public path folder"
  type        = string
}

variable "cdn_alias" {
  description = "The name of the custom domain associated with Route53 and CloudFront"
  type = string
}

variable "my_email" {
  description = "Email address associated with the SNS subscription"
  type = string
}