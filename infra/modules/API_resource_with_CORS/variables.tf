variable "api_id" {
  description = "(Required) ID of the associated REST API"
  type = string
  nullable = false
}

variable "parent_id" {
  description = "(Required) ID of the parent API resource"
  type = string
  nullable = false
}

variable "path_part" {
  description = "(Required) Last path segment of this API resource."
  type = string
  nullable = false
}

variable "http_method" {
  description = "(Required) HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type = string
  default = "POST"
}

variable "lambda_function" {
  description = "Invoke ARN of Lambda Function for Integration with API Gateway"
  type = string
}

