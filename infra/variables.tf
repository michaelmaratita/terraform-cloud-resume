variable "my_domain" {
  description = "My custom domain. e.g. example.com"
  type = string
}

variable "api_name" {
  description = "Name of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the info.title field. If the argument value is different than the OpenAPI value, the argument value will override the OpenAPI value."
  type = string
}

variable "api_description" {
  description = "Description of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the info.description field. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value."
  type = string
}

variable "api_domain" {
  description = "The name of the custom domain associated with Route53 and CloudFront"
  type = string
}

variable "api_db" {
  description = "Path part for API Gateway for Lambda/DynamoDB"
  type = string
}

variable "api_sns" {
  description = "Path part for API Gateway for Lambda/SNS"
  type = string
}

variable "bucket_name" {
  description = "Name of S3 bucket"
  type = string
}

variable "origin_id" {
  description = "ID for Origin Access Control"
  type = string
}

variable "table_name" {
  description = "Name of DynamoDB table"
  type = string
}

variable "table_item" {
  description = "Item values for DynamoDB table"
  type = string
}

variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type = string
}

variable "iam_dynamodb_policy" {
  description = "Policy name for policy attached to DynamoDB/Lambda function"
  type = string
}

variable "iam_sns_policy" {
  description = "Policy name for policy attached to SNS/Lambda function"
  type = string
}

variable "lambda_db_desc" {
  description = "Description for Lambda function that interacts with DynamoDB"
  type = string
}

variable "lambda_db" {
  description = "Name of Lambda/DynamoDB function"
  type = string
}

variable "db_py" {
  description = "Python file for Lambda/DynamoDB function"
  type = string
}

variable "db_zip" {
  description = "Zip file for Lambda/DynamoDB function"
  type = string
}

variable "lambda_sns_desc" {
  description = "Description for Lambda function that interacts with SNS"
  type = string
}

variable "lambda_sns" {
  description = "Name of Lambda/SNS function"
  type = string
}

variable "sns_py" {
  description = "Python file for Lambda/SNS function"
  type = string
}

variable "sns_zip" {
  description = "Zip file for Lambda/SNS function"
  type = string
}

variable "assets_path" {
  description = "Relative file path to Assets files, e.g. CSS, JavaScript, etc."
  type = string
}

variable "html_path" {
  description = "Relative file path to HTML files"
  type = string
}

variable "pdf_path" {
  description = "Relative file path to PDF files"
  type = string
}

variable "topic_display" {
  description = "Display name for SNS Topic. Displays as FROM on email"
  type = string
}

variable "my_email" {
  description = "email address for SNS subscription"
  type = string
}

variable "blog" {
  description = "Name for blog site for Route53"
  type = string
}

variable "record_list" {
  description = "Alias for blog CNAME record"
  type = string
}