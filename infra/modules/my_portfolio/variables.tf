variable "my_domain" {
  description = "The name of the custom domain associated with Route53 and CloudFront"
  type        = string
}

variable "subject_alternative_names" {
  description = "Alternative name for custom domain"
  type = string
}

variable "api_name" {
  description = "(Required) Name of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the info.title field. If the argument value is different than the OpenAPI value, the argument value will override the OpenAPI value."
  type = string
}

variable "api_description" {
  default = "(Optional) Description of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the info.description field. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value."
  type = string
}

variable "api_types" {
  description = "(Required) List of endpoint types. This resource currently only supports managing a single value. Valid values: EDGE, REGIONAL or PRIVATE. If unspecified, defaults to EDGE. If set to PRIVATE recommend to set put_rest_api_mode = merge to not cause the endpoints and associated Route53 records to be deleted. Refer to the documentation for more information on the difference between edge-optimized and regional APIs."
  type = list(string)
}

variable "api_domain_name" {
  description = "The name of the custom domain associated with Route53 and CloudFront"
  type = string
}

variable "dynamodb_path_part" {
  description = "(Required) Last path segment of the DynamoDB API resource."
  type = string
}

variable "sns_path_part" {
  description = "(Required) Last path segment of the SNS API resource."
  type = string
}

variable "http_method" {
  description = "(Optional) Integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONs, ANY, PATCH) specifying how API Gateway will interact with the back end. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. Not all methods are compatible with all AWS integrations. e.g., Lambda function can only be invoked via POST."
  type = string
}

variable "origin_access_name" {
  description = "Name for Origin Access Control"
  type = string
}

variable "origin_access_description" {
  description = "Description for Origin Access Control"
  type = string
}

variable "cloudfront_comment" {
  description = "Comment for CloudFront Distribution"
  type = string
}

variable "origin_id" {
  description = "ID for Origin Access Control"
  type = string
}

variable "table_name" {
  description = "Name for DynamoDB table"
  type = string
}

variable "billing_mode" {
  description = "Billing mode for DynamoDB table"
  type = string
}

variable "read_capacity" {
  description = "Numerical value for read capacity"
  type = number
}

variable "write_capacity" {
  description = "Numerical value for read capacity"
  type = number
}

variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type = string
}

variable "type" {
  description = "Type value for hash key"
  type = string
}

variable "attribute" {
  description = "TTL attribute for DynamoDB table"
  type = string
}

variable "environment" {
  description = "Environment value for DynamoDB table"
  type = string
}

variable "table_item" {
  description = "Item values for DynamoDB table"
  type = string
}

variable "dynamodb_policy_name" {
  description = "Name for DynamoDB IAM Policy"
  type = string
}

variable "sns_policy_name" {
  description = "Name for SNS IAM Policy"
  type = string
}

variable "dynamodb_description" {
  description = "Description for DynamoDB Lambda function"
  type = string
}

variable "dynamodb_function_name" {
  description = "Function name for DynamoDB Lambda function"
  type = string
}

variable "dynamodb_function_file" {
  description = "Path for DynamoDB Lambda Function file"
  type = string
}

variable "dynamodb_function_zip" {
  description = "Path for DynamoDB Lambda Function zip file"
  type = string
}

variable "sns_description" {
  description = "Description for SNS Lambda function"
  type = string
}

variable "sns_function_name" {
  description = "Function name for SNS Lambda function"
  type = string
}

variable "sns_function_file" {
  description = "Path for SNS Lambda Function file"
  type = string
}

variable "sns_function_zip" {
  description = "Path for SNS Lambda Function zip file"
  type = string
}

variable "dynamodb_actions" {
  description = "Allowable actions for Lambda on DynamoDB resource"
  type = list(string)
}

variable "sns_actions" {
  description = "Allowable actions for Lambda on SNS resource"
  type = list(string)
}

variable "bucket_name" {
  description = "Name of S3 bucket"
  type = string
}

variable "bucket_policy_sid" {
  description = "Sid for Bucket Policy"
  type = string
}

variable "assets_path" {
  description = "Relative path for assets files, e.g. CSS, JavaScript, etc."
  type = string
}

variable "html_path" {
  description = "Relative path for HTML files"
  type = string
}

variable "pdf_path" {
  description = "Relative path for PDF files"
  type = string
}

variable "topic_name" {
  description = "Name for SNS Topic"
  type = string
}

variable "topic_display_name" {
  description = "Display name for SNS topic. How the email will show FROM"
  type = string
}

variable "topic_protocol" {
  description = "Protocol used for SNS topic"
  type = string
  default = "email"
}

variable "topic_endpoint" {
  description = "Endpoint for SNS Topic"
  type = string
}

variable "blog" {
  description = "URL string for blog site"
  type = string
}

variable "record_type" {
  description = "Type of DNS record for Route53"
  type = string
}

variable "record_list" {
  description = "Alias for DNS record"
  type = string
}