output "api_resource" {
  description = "Output API Gateway Resource ID for use for API Gateway Deployment"
  value = aws_api_gateway_resource.api_resource.id
}

output "method" {
  description = "Output API Gateway Resource Method for use for API Gateway Deployment"
  value = aws_api_gateway_method.method.id
}

output "lambda_integration" {
  description = "Output API Gateway Resource Integration Method for use for API Gateway Deployment"
  value = aws_api_gateway_integration.lambda_integration.id
}

output "integration_response" {
  description = "Output API Gateway Resource Integration Response for use for API Gateway Deployment"
  value = aws_api_gateway_integration_response.IntegrationResponse.id
}