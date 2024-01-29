output "method" {
  description = "Output API Gateway Resource Method for use for API Gateway Deployment"
  value = aws_api_gateway_method.method.id
}

output "integration" {
  description = "Output API Gateway Resource Integration Method for use for API Gateway Deployment"
  value = aws_api_gateway_integration.integration.id
}


output "integration_response" {
  description = "ID for API Gateway integration response"
  value = aws_api_gateway_integration_response.IntegrationResponse.id
}