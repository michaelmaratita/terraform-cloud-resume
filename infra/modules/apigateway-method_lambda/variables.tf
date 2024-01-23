variable "rest_api" {
  description = "Defined from resource-apigateway outputs containing REST API ID"
  type = string
}

variable "rest_api_parent" {
  description = "Defined from resource-apigateway outputs containing REST API PARENT ID"
  type = string
}

variable "api_path_part" {
  description = "Name for REST API Resource"
  type = string
}

variable "api_domain_name" {
  description = "Domain Name for API Gateway, e.g. api.customdomain.com"
  type = string
}

variable "policy_name" {
  description = "IAM Role policy name for AWS Lambda"
  type = string
}

variable "policy_actions" {
  description = "Allowed actions for IAM Policy"
  type = list(string)
}

variable "lambda_folder" {
  description = "Relative path defined in terraform.tfvars for Lambda functions location"
  type = string
}

variable "lambda_description" {
  description = "Description of the Lambda Function"
  type = string
}

variable "function_name" {
  description = "Name of the Lambda function"
  type = string
}

variable "lambda_resource" {
  description = "ARN of the allowed resources for IAM Policy"
  type = string
}

variable "caller_identity" {
  type = string
}