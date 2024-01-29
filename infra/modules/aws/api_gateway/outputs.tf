output "arn" {
  description = "The ARN of the REST API"
  value = aws_api_gateway_rest_api.api.arn
}

output "created_date" {
  description = "Creation date of the REST API"
  value = aws_api_gateway_rest_api.api.created_date
}

output "execution_arn" {
  description = "Execution ARN part to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function, e.g., arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j, which can be concatenated with allowed stage, method and resource path."
  value = aws_api_gateway_rest_api.api.execution_arn
}

output "id" {
  description = "ID of the REST API"
  value = aws_api_gateway_rest_api.api.id
}

output "root_resource_id" {
  description = "Resource ID of the REST API's root"
  value = aws_api_gateway_rest_api.api.root_resource_id
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_api_gateway_rest_api.api.tags_all
}