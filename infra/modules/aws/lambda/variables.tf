variable "function_name" {
  description = "(Required) Unique name for your Lambda Function."
  type = string
  nullable = false
}

variable "role" {
  description = "(Required) Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources."
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

variable "handler" {
  description = "(Optional) Function entrypoint in your code."
  type = string
  default = "lambda_function.lambda_handler"   # Python handler
}

variable "runtime" {
  description = "(Optional) Identifier of the function's runtime. See Runtimes for valid values."
  type = string
  default = "python3.12"
}

variable "timeout" {
  description = "Optional) Amount of time your Lambda Function has to run in seconds. Defaults to 3. See Limits."
  type = number
  default = 600
}

variable "actions" {
  description = "Include a list of actions that the policy allows or denies."
  type = list(string)
}

variable "resource" {
  description = "(Required in only some circumstances) – If you create an IAM permissions policy, you must specify a list of resources to which the actions apply. If you create a resource-based policy, this element is optional. If you do not include this element, then the resource to which the action applies is the resource to which the policy is attached."
  type = list(string)
}

variable "api_gateway_arn" {
  description = "Source ARN for API Gateway"
  type = string
}