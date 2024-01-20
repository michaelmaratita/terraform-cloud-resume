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

variable "api_lambda" {
  description = "Objects for apigateway-method_lambda module"
  type = object({
    sns = object({
      api_path_part       = string
      function_name       = string
      lambda_description  = string
      lambda_folder       = string
      lambda_resource     = string
      policy_name         = string
      policy_actions      = list(string)
    })
    dynamodb = object({
      api_path_part       = string
      function_name       = string
      lambda_description  = string
      lambda_folder       = string
      lambda_resource     = string
      policy_name         = string
      policy_actions      = list(string)
    })
  })
}