output "integration_response" {
  description = "ID for API Gateway integration response"
  value = aws_api_gateway_integration_response.IntegrationResponse.id
}