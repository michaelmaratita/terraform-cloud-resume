output "api_resource" {
  description = "Output API Gateway Resource ID for use for API Gateway Deployment"
  value = module.api_resource.resource_id
}

output "method" {
  description = "Output API Gateway Resource Method for use for API Gateway Deployment"
  value = module.api_methods.method
}

output "integration" {
  description = "Output API Gateway Resource Integration Method for use for API Gateway Deployment"
  value = module.api_methods.integration
}

output "integration_response" {
  description = "ID for API Gateway integration response"
  value = module.api_methods.integration_response
}

output "path" {
  description = "Path value for API Gateway Resource"
  value = module.api_resource.path
}