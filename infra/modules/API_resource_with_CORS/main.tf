module "api_resource" {
  source = "../aws/api_gateway/api_gateway_resource"

  api_id                  = var.api_id
  parent_id               = var.parent_id
  path_part               = var.path_part
}

module "api_methods" {
  source = "../aws/api_gateway/api_gateway_resource/api_gateway_method"

  api_id                  = var.api_id
  resource_id             = module.api_resource.resource_id
  integration_http_method = var.http_method
  uri                     = var.lambda_function
}

module "api_methods_cors" {
  source = "../aws/api_gateway/api_gateway_resource/api_gateway_method"

  api_id                  = var.api_id
  resource_id             = module.api_resource.resource_id
  http_method             = "OPTIONS"
  type                    = "MOCK"
  
  response_templates = {
    "application/json" = "{\"statusCode\" : 200}"
  }

  method_response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Headers" = true
  }

  integration_response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = "'*'", 
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'OPTIONS,POST'"
  }

  depends_on = [ module.api_resource ]
}