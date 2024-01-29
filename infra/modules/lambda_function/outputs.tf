output "lambda_arn" {
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
  value = module.lambda_function.arn
}

output "function_name" {
  description = "Unique name for your Lambda Function."
  value = module.lambda_function.function_name
}

output "invoke_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value = module.lambda_function.invoke_arn
}

output "last_modified" {
  description = "Date this resource was last modified."
  value = module.lambda_function.last_modified
}

output "qualified_arn" {
  description = "Qualified ARN (ARN with lambda version number) to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value = module.lambda_function.qualified_arn
}

output "signing_job_arn" {
  description = "ARN of the signing job."
  value = module.lambda_function.signing_job_arn
}

output "signing_profile_version_arn" {
  description = "ARN of the signing profile version."
  value = module.lambda_function.signing_profile_version_arn
}

output "source_code_size" {
  description = "Size in bytes of the function .zip file."
  value = module.lambda_function.source_code_size
}

output "version" {
  description = "Latest published version of your Lambda Function."
  value = module.lambda_function.version
}

output "assume_role" {
  description = "Lambda AWS sts:AssumeRole"
  value = module.lambda_function.assume_role
}

output "policy" {
  description = "IAM Policy for Lambda function"
  value = module.lambda_function.policy
}

output "iam_role_arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value = module.iam_role_lambda.arn
}

output "create_date" {
  description = "Creation date of the IAM role."
  value = module.iam_role_lambda.create_date
}

output "id" {
  description = "Name of the role."
  value = module.iam_role_lambda.id
}

output "name" {
  description = "Name of the role."
  value = module.iam_role_lambda.name
}

output "unique_id" {
  description = "Stable and unique string identifying the role."
  value = module.iam_role_lambda.unique_id
}