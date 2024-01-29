resource "aws_api_gateway_method" "method" {
  rest_api_id    = var.api_id
  resource_id    = var.resource_id
  http_method    = var.http_method # default == "POST"
  authorization  = var.authorization # default == "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = var.api_id
  resource_id             = var.resource_id
  http_method             = aws_api_gateway_method.method.http_method  
  integration_http_method = var.integration_http_method # default == null
  type                    = var.type # default == "AWS"
  uri                     = var.uri   # default == null

  request_templates = var.response_templates
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = var.api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.method.http_method
  status_code = 200
  
  response_parameters = var.method_response_parameters # default == "method.response.header.Access-Control-Allow-Origin" = true

  response_models = var.response_models # default == "application/json" = "Empty"
}

resource "aws_api_gateway_integration_response" "IntegrationResponse" {
  rest_api_id = var.api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.method.http_method
  status_code = aws_api_gateway_method_response.response_200.status_code

  response_parameters = var.integration_response_parameters # default == "method.response.header.Access-Control-Allow-Origin" = "*"

  depends_on = [ 
    aws_api_gateway_integration.integration,
    aws_api_gateway_method.method
  ]
}