variable "function_name" {
  description = "(Required) Unique name for your Lambda Function."
  type = string
  nullable = false
}

variable "file_name" {
  description = "(Optional) Path to the function's deployment package within the local filesystem. Exactly one of filename, image_uri, or s3_bucket must be specified."
  type = string
  nullable = true
}

variable "zip_file_name" {
  description = "(Optional) Path to the function's deployment package within the local filesystem. Exactly one of filename, image_uri, or s3_bucket must be specified."
  type = string
  nullable = true
}

variable "description" {
  description = "(Optional) Description of what your Lambda Function does."
  type = string
  nullable = true
}

variable "actions" {
  description = "Include a list of actions that the policy allows or denies."
  type = list(string)
}

variable "resource" {
  description = "(Required in only some circumstances) – If you create an IAM permissions policy, you must specify a list of resources to which the actions apply. If you create a resource-based policy, this element is optional. If you do not include this element, then the resource to which the action applies is the resource to which the policy is attached."
  type = list(string)
}

variable "policy_name" {
  description = "(Optional) The name of the role policy. If omitted, Terraform will assign a random, unique name."
  type = string
}

variable "api_gateway_arn" {
  description = "Source ARN for API Gateway"
  type = string
}