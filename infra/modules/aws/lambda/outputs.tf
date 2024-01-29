output "arn" {
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
  value = aws_lambda_function.lambda.arn
}

output "function_name" {
  description = "Unique name for your Lambda Function."
  value = aws_lambda_function.lambda.function_name
}

output "invoke_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value = aws_lambda_function.lambda.invoke_arn
}

output "last_modified" {
  description = "Date this resource was last modified."
  value = aws_lambda_function.lambda.last_modified
}

output "qualified_arn" {
  description = "Qualified ARN (ARN with lambda version number) to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value = aws_lambda_function.lambda.qualified_arn
}

output "signing_job_arn" {
  description = "ARN of the signing job."
  value = aws_lambda_function.lambda.signing_job_arn
}

output "signing_profile_version_arn" {
  description = "ARN of the signing profile version."
  value = aws_lambda_function.lambda.signing_profile_version_arn
}

output "source_code_size" {
  description = "Size in bytes of the function .zip file."
  value = aws_lambda_function.lambda.source_code_size
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_lambda_function.lambda.tags_all
}

output "version" {
  description = "Latest published version of your Lambda Function."
  value = aws_lambda_function.lambda.version
}

output "assume_role" {
  description = "Lambda AWS sts:AssumeRole"
  value = data.aws_iam_policy_document.assume_role.json
}

output "policy" {
  description = "IAM Policy for Lambda function"
  value = data.aws_iam_policy_document.policy.json
}