output "resource_id" {
  description = "Output API Gateway Resource ID for use for API Gateway Deployment"
  value = aws_api_gateway_resource.resource.id
}

output "path" {
  description = "Path value for API Gateway Resource"
  value = aws_api_gateway_resource.resource.path
}