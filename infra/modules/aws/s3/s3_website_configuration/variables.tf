variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "sid" {
  description = "statement ID for Policy"
  type = string
}

variable "cloudfront_distribution_arn" {
  description = "ARN for CloudFront distribution"
  type = string
}

variable "resource" {
  description = "(Required in only some circumstances) – If you create an IAM permissions policy, you must specify a list of resources to which the actions apply. If you create a resource-based policy, this element is optional. If you do not include this element, then the resource to which the action applies is the resource to which the policy is attached."
  type = list(string)
}