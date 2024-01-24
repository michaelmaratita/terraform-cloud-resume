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

variable "sns_api_resource" {
  description = "API Gateway SNS Resource ID for use for API Gateway Deployment"
  type = string
}

variable "sns_method" {
  description = "API Gateway SNS Resource Method for use for API Gateway Deployment"
  type = string 
}

variable "sns_lambda_integration" {
  description = "API Gateway SNS Resource Integration Method for use for API Gateway Deployment"
  type = string
}

variable "sns_integration_response" {
  description = "API Gateway SNS Resource Integration Response for use for API Gateway Deployment"
  type = string
}

variable "db_api_resource" {
  description = "API Gateway DynamoDB Resource ID for use for API Gateway Deployment"
  type = string
}

variable "db_method" {
  description = "API Gateway DynamoDB Resource Method for use for API Gateway Deployment"
 type = string 
}

variable "db_lambda_integration" {
  description = "API Gateway DynamoDB Resource Integration Method for use for API Gateway Deployment"
  type = string
}

variable "db_integration_response" {
  description = "API Gateway DynamoDB Resource Integration Response for use for API Gateway Deployment"
  type = string
}

variable "caller_identity" {
  description = "Passed variable from data.aws_caller_identity"
  type = string
}