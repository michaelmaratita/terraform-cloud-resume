output "id" {
  description = "ID of the deployment"
  value = aws_api_gateway_deployment.deploy.id
}

output "invoke_url" {
 description = "URL to invoke the API pointing to the stage, e.g., https://z4675bid1j.execute-api.eu-west-2.amazonaws.com/prod"
 value = aws_api_gateway_deployment.deploy.invoke_url 
}

output "execution_arn" {
  description = "Execution ARN to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function, e.g., arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j/prod"
  value = aws_api_gateway_deployment.deploy.execution_arn
}

output "created_date" {
  description = "Creation date of the deployment"
  value = aws_api_gateway_deployment.deploy.created_date
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_api_gateway_stage.production.tags_all
}